# 处理教程截图：脱敏（公网 IP / MAC / 账号痕迹）+ 单处水印（内容区右上角）
# 用法：powershell -File protect-media.ps1 [-Path <jpg/png>]
param(
    [string]$Path = ""
)

$ErrorActionPreference = "Stop"
Add-Type -AssemblyName System.Drawing

$Utf8Bom = New-Object System.Text.UTF8Encoding $true
$WatermarkText = "RouterOS 入门与精通"
$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$DefaultDir = Join-Path (Split-Path -Parent $ScriptDir) "cookbook\home\images"

function Get-Luma([System.Drawing.Color]$c) {
    return (0.299 * $c.R + 0.587 * $c.G + 0.114 * $c.B)
}

function Sample-Color([System.Drawing.Bitmap]$bmp, [int]$x, [int]$y) {
    $x = [Math]::Max(0, [Math]::Min($bmp.Width - 1, $x))
    $y = [Math]::Max(0, [Math]::Min($bmp.Height - 1, $y))
    return $bmp.GetPixel($x, $y)
}

function Fill-Box {
    param($g, [System.Drawing.Bitmap]$bmp, [int]$x, [int]$y, [int]$w, [int]$h, $color = $null)
    if ($null -eq $color) { $color = Sample-Color $bmp ($x - 2) $y }
    $brush = New-Object System.Drawing.SolidBrush $color
    $g.FillRectangle($brush, $x, $y, $w, $h)
    $brush.Dispose()
}

function Write-Label {
    param($g, [string]$text, [int]$x, [int]$y, [int]$em, $color, [string]$family = "Consolas")
    $font = New-Object System.Drawing.Font $family, $em, ([System.Drawing.FontStyle]::Regular), ([System.Drawing.GraphicsUnit]::Pixel)
    $brush = New-Object System.Drawing.SolidBrush $color
    $g.TextRenderingHint = [System.Drawing.Text.TextRenderingHint]::AntiAlias
    $g.DrawString($text, $font, $brush, $x, $y)
    $font.Dispose()
    $brush.Dispose()
}

function Add-CornerWatermark {
    param([System.Drawing.Graphics]$g, [System.Drawing.Bitmap]$bmp)
    # 右上角、避开窗口关闭按钮：标题栏下方内侧。CLI 提示在左下，WinBox 状态栏也在底部，故不用左下角。
    $em = [Math]::Max(14, [int]($bmp.Width / 64))
    $font = New-Object System.Drawing.Font "Microsoft YaHei", $em, ([System.Drawing.FontStyle]::Regular), ([System.Drawing.GraphicsUnit]::Pixel)
    $sz = $g.MeasureString($WatermarkText, $font)
    $padR = 18
    $padT = 42
    $x = [int]($bmp.Width - $sz.Width - $padR)
    $y = $padT
    $sample = Sample-Color $bmp ([int]($bmp.Width * 0.92)) ([int]($bmp.Height * 0.12))
    if ((Get-Luma $sample) -gt 140) {
        $col = [System.Drawing.Color]::FromArgb(96, 25, 70, 120)
    } else {
        $col = [System.Drawing.Color]::FromArgb(100, 230, 235, 240)
    }
    $brush = New-Object System.Drawing.SolidBrush $col
    $g.TextRenderingHint = [System.Drawing.Text.TextRenderingHint]::AntiAlias
    $g.DrawString($WatermarkText, $font, $brush, $x, $y)
    $font.Dispose()
    $brush.Dispose()
}

function Save-Jpeg([System.Drawing.Bitmap]$bmp, [string]$dest) {
    $tmp = $dest + ".tmp.jpg"
    $codec = [System.Drawing.Imaging.ImageCodecInfo]::GetImageEncoders() | Where-Object { $_.MimeType -eq "image/jpeg" }
    $ep = New-Object System.Drawing.Imaging.EncoderParameters 1
    $ep.Param[0] = New-Object System.Drawing.Imaging.EncoderParameter ([System.Drawing.Imaging.Encoder]::Quality, [long]90)
    $bmp.Save($tmp, $codec, $ep)
    $ep.Dispose()
    if (Test-Path $dest) { Remove-Item $dest -Force }
    Move-Item $tmp $dest -Force
}

$green = [System.Drawing.Color]::FromArgb(255, 0, 200, 70)
$black = [System.Drawing.Color]::FromArgb(255, 12, 12, 12)
$white = [System.Drawing.Color]::FromArgb(255, 252, 252, 252)
$grayText = [System.Drawing.Color]::FromArgb(255, 40, 40, 40)
$winRow = [System.Drawing.Color]::FromArgb(255, 248, 248, 248)

function Protect-One([string]$file) {
    $name = [IO.Path]::GetFileName($file)
    $img = [System.Drawing.Image]::FromFile($file)
    $bmp = New-Object System.Drawing.Bitmap $img.Width, $img.Height
    $g = [System.Drawing.Graphics]::FromImage($bmp)
    $g.SmoothingMode = [System.Drawing.Drawing2D.SmoothingMode]::AntiAlias
    $g.DrawImage($img, 0, 0, $img.Width, $img.Height)
    $img.Dispose()

    switch ($name) {
        "pppoe-dial-s1-winbox.jpg" {
            Fill-Box $g $bmp 788 172 190 48
            Write-Label $g "00:11:22:33:44:55" 798 184 16 $grayText "Segoe UI"
        }
        "pppoe-dial-s1-cli.jpg" {
            Fill-Box $g $bmp 698 172 320 78 $black
            Write-Label $g "mac-address=00:11:22:33:44:55" 704 178 16 $green
            Write-Label $g "mac-address=00:11:22:33:44:56" 704 210 16 $green
        }
        "pppoe-dial-s2-winbox.jpg" {
            Fill-Box $g $bmp 248 292 470 108 $white
        }
        "pppoe-dial-s3-winbox.jpg" {
            Fill-Box $g $bmp 930 458 250 95 $white
            Write-Label $g "203.0.113.10" 990 478 16 $grayText "Segoe UI"
            Write-Label $g "192.0.2.1" 990 518 16 $grayText "Segoe UI"
        }
        "pppoe-dial-s3-cli.jpg" {
            Fill-Box $g $bmp 16 305 470 95 $black
            Write-Label $g "local-address: 203.0.113.10" 28 318 16 $green
            Write-Label $g "remote-address: 192.0.2.1" 28 350 16 $green
            Fill-Box $g $bmp 16 488 470 42 $black
            Write-Label $g "service-name: ISP-ACCESS" 28 496 16 $green
        }
        "pppoe-dial-s4-cli.jpg" {
            Fill-Box $g $bmp 268 328 310 36 $black
            Write-Label $g "dst-address=203.0.113.10/32" 276 334 16 $green
        }
        "pppoe-dial-s5-winbox.jpg" {
            Fill-Box $g $bmp 552 152 210 100 $white
            Write-Label $g "192.0.2.53" 568 178 16 $grayText "Segoe UI"
            Write-Label $g "192.0.2.54" 568 208 16 $grayText "Segoe UI"
        }
        "pppoe-dial-s5-cli.jpg" {
            Fill-Box $g $bmp 488 276 410 40 $black
            Write-Label $g "192.0.2.53,192.0.2.54     no" 500 284 16 $green
            Fill-Box $g $bmp 488 548 420 42 $black
            Write-Label $g "192.0.2.53,192.0.2.54     yes" 500 556 16 $green
        }
        default { }
    }

    Add-CornerWatermark $g $bmp
    $g.Dispose()
    Save-Jpeg $bmp $file
    $bmp.Dispose()
    Write-Host "protected $name"
}

$targets = @()
if ($Path -and (Test-Path $Path)) {
    $item = Get-Item $Path
    if ($item.PSIsContainer) {
        $targets = Get-ChildItem $item.FullName -Include *.jpg,*.jpeg,*.png -File -Recurse
    } else {
        $targets = @($item)
    }
} else {
    $targets = Get-ChildItem $DefaultDir -Filter *.jpg -File
}

foreach ($t in $targets) { Protect-One $t.FullName }
