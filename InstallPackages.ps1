Set-ExecutionPolicy RemoteSigned
iwr https://chocolatey.org/install.ps1 -UseBasicParsing | iex

cup -y all
Get-Content "package_list.txt" |
ForEach-Object{
    if([string].IsNullOrEmpty($_)){
        return;
    }
    choco install -y $_
}