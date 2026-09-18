@echo off
echo Saving master NDNC template...
echo.

REM Copy RK's revised version to canonical location
copy "C:\Users\Owner\AppData\Roaming\Claude\local-agent-mode-sessions\d2ba9616-bf09-47a9-9a39-490142368e84\0be42fa3-27fc-4515-8b7b-4ca937624600\local_f0889491-f4bb-474b-9dbd-5eb576537e8b\uploads\SM_NDNC_Agreement RK 2026-09-17.docx" "F:\AI\SM_NDNC_MASTER_TEMPLATE.docx" /Y

REM Also extract to text for Claude to read the content
pandoc "C:\Users\Owner\AppData\Roaming\Claude\local-agent-mode-sessions\d2ba9616-bf09-47a9-9a39-490142368e84\0be42fa3-27fc-4515-8b7b-4ca937624600\local_f0889491-f4bb-474b-9dbd-5eb576537e8b\uploads\SM_NDNC_Agreement RK 2026-09-17.docx" -t markdown -o "F:\AI\.claudeInternal\SM_NDNC_MASTER_content.md" 2>nul

if %ERRORLEVEL% NEQ 0 (
    echo Note: pandoc not available - skipping text extraction.
    echo Master template still saved successfully.
) else (
    echo Content extracted for reference.
)

echo.
echo === Master template saved to F:\AI\SM_NDNC_MASTER_TEMPLATE.docx ===
pause
