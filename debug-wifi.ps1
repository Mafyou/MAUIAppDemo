$lastTwoIPCouple = Read-Host "Last 2 couple of ip ?"

Function Open-WifiConnection {
    adb.exe tcpip 5555
    $ip = "192.168." + $lastTwoIPCouple + ":5555"
    adb.exe connect $ip
}
$rootLocation = (Get-Location).Path
Set-Location -Path "C:\Program Files (x86)\Android\android-sdk"
try {
    Open-WifiConnection
}
catch {
    Write-Host "Need to add ADB because:"
    Write-Host -ForegroundColor Red $_
    Write-Host -ForegroundColor Green "1/ Install it => 'choco install adb' in a PowerShell Admin Prompt"
    Write-Host -ForegroundColor Green "2/ Plug-in in USB to your computer"
    Write-Host -ForegroundColor Green "3/ Re-run this script"
}
finally {
    Set-Location $rootLocation
}