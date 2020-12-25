remove-item alias:cd -force
Set-Variable -Name dashDir -Value "" -Scope global;
function cd($target)
{
    if($target.EndsWith(".lnk"))
    {
        $sh = new-object -com wscript.shell
        $targetpath = $sh.CreateShortcut($target).TargetPath
        set-location $targetpath
    }
    else
    {
        if($target -eq '-')
        {
            $target = $dashDir
        }
        Set-Variable -Name dashDir -Value $(pwd) -Scope global;
        set-location $target        
    }
}