param(
    [string]$Root = (Resolve-Path (Join-Path $PSScriptRoot '..')).Path
)

$ErrorActionPreference = 'Stop'

$inventoryPath = Join-Path $Root 'conductor/raw-data-structure-inventory.json'
$rawRoot = Join-Path $Root 'raw/Data structure'
$outPath = Join-Path $Root 'wiki/sources/raw-data-structure-full-extracted-notes.md'

function To-ForwardSlashPath {
    param([string]$Path)
    return ($Path -replace '\\', '/')
}

function To-RelativeProjectPath {
    param([string]$FullName)
    $relative = [System.IO.Path]::GetRelativePath($Root, $FullName)
    return To-ForwardSlashPath $relative
}

function Escape-YamlValue {
    param([string]$Value)
    return ($Value -replace '"', '\"')
}

$pdfItems = Get-Content -LiteralPath $inventoryPath -Raw -Encoding UTF8 | ConvertFrom-Json
$allRawFiles = Get-ChildItem -LiteralPath $rawRoot -Recurse -File |
    Sort-Object @{ Expression = { To-RelativeProjectPath $_.FullName } }

$extractedBySource = @{}
foreach ($item in $pdfItems) {
    $extractedBySource[$item.path] = $item
}

$generatedAt = Get-Date -Format 'yyyy-MM-dd'
$builder = [System.Text.StringBuilder]::new()

[void]$builder.AppendLine('---')
[void]$builder.AppendLine('type: source-archive')
[void]$builder.AppendLine('tags: [raw-sources, data-structure, extracted-text, detailed]')
[void]$builder.AppendLine("created: $generatedAt")
[void]$builder.AppendLine("updated: $generatedAt")
[void]$builder.AppendLine('sources: [raw/Data structure]')
[void]$builder.AppendLine('---')
[void]$builder.AppendLine()
[void]$builder.AppendLine('# Raw Data Structure Full Extracted Notes')
[void]$builder.AppendLine()
[void]$builder.AppendLine("ไฟล์นี้รวมข้อมูลจาก `raw/Data structure` ทั้งหมด ณ วันที่ $generatedAt เพื่อใช้เป็น source note แบบละเอียดใน `wiki/sources`.")
[void]$builder.AppendLine()
[void]$builder.AppendLine('เนื้อหามี 2 ส่วนหลัก:')
[void]$builder.AppendLine('- `Source Coverage` เป็นดัชนีครบทุกไฟล์ PDF/รูป พร้อมลิงก์กลับไปยัง raw source')
[void]$builder.AppendLine('- `Full Extracted Text` เป็นข้อความที่ถอดจาก PDF ทุกไฟล์ที่มี text layer ใน `conductor/extracted`')
[void]$builder.AppendLine()
[void]$builder.AppendLine('> [!note] Visual-only sources')
[void]$builder.AppendLine('> ไฟล์รูปภาพและ PDF ที่ไม่มี text layer ถูกเก็บเป็น source ด้วยลิงก์/preview เพื่อเปิดดูภาพต้นฉบับโดยตรงใน Obsidian.')
[void]$builder.AppendLine()

[void]$builder.AppendLine('## Source Coverage')
[void]$builder.AppendLine()
[void]$builder.AppendLine('| Type | Source | Detail | Preview |')
[void]$builder.AppendLine('|---|---|---|---|')

foreach ($file in $allRawFiles) {
    $rel = To-RelativeProjectPath $file.FullName
    $ext = $file.Extension.TrimStart('.').ToLowerInvariant()
    if ([string]::IsNullOrWhiteSpace($ext)) { $ext = 'file' }
    $name = $file.Name -replace '\|', '\|'

    if ($extractedBySource.ContainsKey($rel)) {
        $item = $extractedBySource[$rel]
        $detail = "$($item.pages) p / $($item.text_chars) chars; extracted: ``$($item.extract_file)``"
        $preview = "![[$($rel)#page=1|120]]"
    }
    elseif ($ext -eq 'pdf') {
        $detail = "$($file.Length) bytes; PDF without extracted text"
        $preview = "![[$($rel)#page=1|120]]"
    }
    elseif ($ext -in @('png', 'jpg', 'jpeg', 'webp')) {
        $detail = "$($file.Length) bytes; visual source"
        $preview = "![[$($rel)|120]]"
    }
    else {
        $detail = "$($file.Length) bytes"
        $preview = ''
    }

    [void]$builder.AppendLine("| $ext | [[$rel|$name]] | $detail | $preview |")
}

[void]$builder.AppendLine()
[void]$builder.AppendLine('## Full Extracted Text')
[void]$builder.AppendLine()
[void]$builder.AppendLine('ข้อความด้านล่างคง page markers จากไฟล์ถอดข้อความเดิม เพื่อใช้เทียบกับหน้าต้นฉบับได้ง่าย.')
[void]$builder.AppendLine()

$pdfIndex = 1
foreach ($item in ($pdfItems | Sort-Object path)) {
    $sourcePath = [string]$item.path
    $extractPath = Join-Path $Root ([string]$item.extract_file)
    $title = [System.IO.Path]::GetFileName($sourcePath)
    $safeTitle = $title -replace '#', '\#'

    [void]$builder.AppendLine("### $pdfIndex. $safeTitle")
    [void]$builder.AppendLine()
    [void]$builder.AppendLine("- Source: [[$sourcePath|$title]]")
    [void]$builder.AppendLine("- Pages/Text: $($item.pages) pages / $($item.text_chars) chars")
    [void]$builder.AppendLine("- Extracted file: `$($item.extract_file)`")
    [void]$builder.AppendLine()

    if (Test-Path -LiteralPath $extractPath) {
        $text = Get-Content -LiteralPath $extractPath -Raw -Encoding UTF8
        $text = $text.Trim()
        if ([string]::IsNullOrWhiteSpace($text)) {
            [void]$builder.AppendLine('_No extracted text._')
        }
        else {
            [void]$builder.AppendLine('```text')
            [void]$builder.AppendLine($text)
            [void]$builder.AppendLine('```')
        }
    }
    else {
        [void]$builder.AppendLine("_Missing extracted file: `$($item.extract_file)`._")
    }

    [void]$builder.AppendLine()
    $pdfIndex++
}

$utf8NoBom = [System.Text.UTF8Encoding]::new($false)
[System.IO.File]::WriteAllText($outPath, $builder.ToString(), $utf8NoBom)
Write-Host "Wrote $outPath"
