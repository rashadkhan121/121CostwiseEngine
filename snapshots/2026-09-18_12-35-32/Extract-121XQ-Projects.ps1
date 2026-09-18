# Extract-121XQ-Projects.ps1
# Reads 121XQ and 121XQAI project folders and dumps readable content to .claudeInternal
# so the team can review without needing direct .claude access

$Out = "F:\AI\.claudeInternal\121XQ-Project-Extract.md"
$log = [System.Text.StringBuilder]::new()

function Log($msg) { $log.AppendLine($msg) | Out-Null }

Log "# 121XQ + 121XQAI Project Extract"
Log "Generated: $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')"
Log ""

$projects = @("121XQ", "121XQAI")

foreach ($proj in $projects) {
    $path = "F:\AI\.claude\projects\$proj"
    Log "---"
    Log "## PROJECT: $proj"
    Log "Path: $path"
    Log ""

    if (-not (Test-Path $path)) {
        Log "**NOT FOUND**"
        Log ""
        continue
    }

    # List all files
    $files = Get-ChildItem $path -Recurse -File | Where-Object {
        $_.Extension -match "\.(md|txt|html|json|js|ts|py|toml|yaml|yml|css|svg|xml|sh|ps1)$" -and
        $_.FullName -notmatch "node_modules|\.git|dist|build"
    } | Sort-Object FullName

    Log "### File Index ($($files.Count) files)"
    foreach ($f in $files) {
        $rel = $f.FullName.Replace($path, "").TrimStart("\")
        Log "- $rel ($([math]::Round($f.Length/1KB, 1)) KB) — Modified: $($f.LastWriteTime.ToString('yyyy-MM-dd HH:mm'))"
    }
    Log ""

    # Read content of key files (md, txt, html under 100KB)
    Log "### File Contents"
    foreach ($f in $files) {
        if ($f.Length -gt 102400) { continue } # skip >100KB
        $rel = $f.FullName.Replace($path, "").TrimStart("\")
        Log ""
        Log "#### $rel"
        Log '```'
        try {
            $content = Get-Content $f.FullName -Raw -ErrorAction Stop
            Log ($content.Substring(0, [Math]::Min($content.Length, 8000)))
            if ($content.Length -gt 8000) { Log "[... truncated at 8000 chars ...]" }
        } catch {
            Log "[Could not read: $($_.Exception.Message)]"
        }
        Log '```'
    }
    Log ""
}

$log.ToString() | Out-File $Out -Encoding UTF8
Write-Host "Extracted to: $Out"
Write-Host "Tell Claude: 'extraction done'"
