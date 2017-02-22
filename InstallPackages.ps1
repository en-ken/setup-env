#set option as Args[0]
Set-ExecutionPolicy RemoteSigned
Invoke-WebRequest https://chocolatey.org/install.ps1 -UseBasicParsing | Invoke-Expression

cup -y all
$opt = $Args[0]
if([string]::IsNullOrEmpty($opt)){
    $opt = "common"
}

$wants = $false
Get-Content "package_list.txt" | ForEach-Object{
    if([string]::IsNullOrEmpty($_)){
        return
    }
    $str = $_ -replace ' ','' -replace "#.*$",'' #remove spaces and comments.
    
    if($str -match "\[.*\]") 
    {
        #common and selected segments are only installed.
        $wants = $str -match "(common|$opt)"
        return
    }
    
    if($wants){
        choco install -y $str
    }
}