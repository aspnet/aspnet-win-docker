$tempPath = "c:\ProgramData\Microsoft DNX\bin"
$dnvmPs1Path = Join-Path $tempPath "dnvm.ps1"
$dnvmCmdPath = Join-Path $tempPath "dnvm.cmd"

Write-Host "Using temporary directory: $tempPath"
if (!(Test-Path $tempPath)) { md $tempPath | Out-Null }

$webClient = New-Object System.Net.WebClient
Write-Host "Downloading DNVM.ps1 to $dnvmPs1Path"
$webClient.DownloadFile('https://raw.githubusercontent.com/aspnet/dnvm/brecon/install_g/src/dnvm.ps1', $dnvmPs1Path)
Write-Host "Downloading DNVM.cmd to $dnvmCmdPath"
$webClient.DownloadFile('https://raw.githubusercontent.com/aspnet/dnvm/brecon/install_g/src/dnvm.cmd', $dnvmCmdPath)

#$env:PATH = "$env:PATH;C:\ProgramData\Microsoft DNX\bin"
$oldPath = 	[Environment]::GetEnvironmentVariable("PATH", "MACHINE")
[Environment]::SetEnvironmentVariable("PATH", "$oldPath;C:\ProgramData\Microsoft DNX\bin", "MACHINE")