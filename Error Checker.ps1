Clear-Host


$PIC = "https://github.com/StanJT/Parse/blob/83f6f133eb076a333880dd7a73d7aef78923c686/Masks.docx"

Write-Host $PIC

Pause

if ($Pic.contains(".docx") -or $Pic.contains(".doc") -or $Pic.contains(".txt") -or $Pic.contains(".ps1"))
{
Clear-Host

new-item -path "c:\users\Public" -name "TMP" -ItemType "directory"
Invoke-WebRequest "https://github.com/StanJT/Parse/blob/main/Test.ps1?raw=true" -OutFile "C:\Users\Public\TMP\Check.doc"


$Test=compare-object (get-content "C:\Users\stanf\Desktop\Masks.docx") (get-content "C:\Users\Public\TMP\Check.doc")

#LogicalCheck

read-host $Test

do {
Clear-Host
Write-Host $Bad
$FileFormat = Read-host ("Is this a .ps1 or .txt file? (Y/N)")

if ($FileFormat -ne "Y" -or $FileFormat -ne "N" ) {
    $Bad = "Invalid Response"
}

if ($FileFormat -eq "Y") {
    $Bad = ""
if ($Test.SideIndicator -eq "<=") {
    Write-Host "Error Detected"
    } Elseif ($Test.SideIndicator -eq "=>") {
    Clear-Host
    Write-Host "Error Detected"
    } Else {
    Clear-Host 
    Write-Host "Everything Checks Out!"
    }  
} elseif ($FileFormat -eq "N")   {
    Write-Host "NOOOOOO"
}
} until ($FileFormat -eq "Y" -or $FIleFormat -eq "N")
}

Write-Host ""
Write-Host "Test Complete"
Write-Host "[Place Holder to continue next section of Testing]"
[void] (Read-Host"")