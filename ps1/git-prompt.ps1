# Adds the current branch to the bash prompt when the working directory is
# part of a Git repository. Includes color-coding and indicators to quickly
# indicate the status of working directory.
#
# Based upon the following gists:
# <https://gist.github.com/henrik/31631>
# <https://gist.github.com/srguiwiz/de87bf6355717f0eede5>
#
# License: MIT, unless the authors of those two gists object :)

function git_branch() {
    # -- Finds and outputs the current branch name by parsing the list of
    #    all branches
    # -- Current branch is identified by an asterisk at the beginning
    # -- If not in a Git repository, error message goes to /dev/null and
    #    no output is produced
    return $(git branch --no-color 2>$null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/')
}

function git_status() {
    # Outputs a series of indicators based on the status of the
    # working directory:
    # + changes are staged and ready to commit
    # ! unstaged changes are present
    # ? untracked files are present
    # S changes have been stashed
    # P local commits need to be pushed to the remote
    
	$status = $(git status --porcelain 2>$null)
    $output = New-Object System.Collections.Generic.List[System.String]

	if($status)
	{
		if($(select-string -pattern '^[U]|^.[U]' -InputObject $status)){$output.add("|")}
		elseif($(select-string -pattern '^.[MD]' -InputObject $status)){$output.add("!")}
		elseif($(select-string -pattern '^[MADRC]' -InputObject $status)){$output.add("+")}
		
		if($(select-string -pattern '^\?\?' -InputObject $status)){$output.add("?")}
	}

	if($(git log HEAD --not --remotes)){$output.add("P")}

	# what was this for??
	#if($(git stash list)){$output.add("S")}

	return $output
}

function git_color($state) {
    # Receives output of git_status as argument; produces appropriate color
    # code based on status of working directory:
    # - White if everything is clean
    # - Green if all changes are staged
    # - Red if there are uncommitted changes with nothing staged
    # - Yellow if there are both staged and unstaged changes
    # - Blue if there are unpushed commits
	
	$color = "white"
	if($state.count -gt 0)
	{
		if($($state -contains "|")){$color = "yellow"}    # unmerged
		elseif($($state -contains "!")){$color = "red"}   # dirty
		elseif($($state -contains "+")){$color = "green"} # staged
		elseif($($state -contains "P")){$color = "blue"}  # needs push

		#? is for not staged and it wouold be nice to make this italics
	}

	return $color
}

function git_prompt() {
    # First, get the branch name...
    $branch = $(git_branch)
    # Empty output? Then we're not in a Git repository, so bypass the rest
    # of the function, producing no output
    if($branch)
	{
        $state = $(git_status)
        $color = $(git_color $state)

		Write-Host " (" -NoNewLine -ForegroundColor White
		Write-Host "$branch" -NoNewLine -ForegroundColor $color
		Write-Host ")" -NoNewLine -ForegroundColor White
    }
}
