# Event Log IDs
$eventLogIDs = @(100, 101, 200, 201)

# Application Files
$appFiles = @(
    "C:\Windows\SysWOW64\config\systemprofile\AppData\Local\ScreenConnect Client (*)\user.config",
    "%PROGRAMDATA%\ScreenConnect Client (*)\",
    "%PROGRAMFILES(x86)%\ScreenConnect Client (*)\",
    "%SYSTEMROOT%\temp\screenconnect\*\",
    "%USERPROFILE%\Documents\ConnectWiseControl\captures\",
    "%USERPROFILE%\Documents\ConnectWiseControl\Temp\malware.exe",
    "%USERPROFILE%\Documents\ConnectWiseControl\Files\",
    "%SYSTEMROOT%\temp"
)

# Query Event Logs
foreach ($id in $eventLogIDs) {
    Get-WinEvent -FilterHashtable @{LogName='Application'; ID=$id} | Format-List
}

# Check Application Files
foreach ($file in $appFiles) {
    Get-ChildItem -Path $file -ErrorAction SilentlyContinue | ForEach-Object {
        Get-ItemProperty -Path $_.FullName
    }
}
