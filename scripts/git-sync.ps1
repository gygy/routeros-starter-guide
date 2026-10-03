# Standard git-sync for G:\gitea\RouterOS入门与精通
param(
    [string]$Message = "chore: sync workspace changes",
    [string]$RepoRoot = (Join-Path $PSScriptRoot "..")
)

$ErrorActionPreference = "Stop"
$Root = (Resolve-Path $RepoRoot).Path
Set-Location $Root

$Branch = if ($env:GIT_BRANCH) { $env:GIT_BRANCH } else { "main" }
$SshKey = if ($env:GIT_SSH_KEY) { $env:GIT_SSH_KEY } else { Join-Path $env:USERPROFILE ".ssh\id_ed25519_gitea" }
if (-not $env:GIT_SSH_COMMAND) {
    $env:GIT_SSH_COMMAND = "ssh -p 8022 -i `"$SshKey`" -o IdentitiesOnly=yes -o ConnectTimeout=15 -o StrictHostKeyChecking=accept-new"
}

function Get-GitExe {
    foreach ($c in @("git", "$env:ProgramFiles\Git\cmd\git.exe")) {
        if ($c -eq "git") {
            $cmd = Get-Command git -ErrorAction SilentlyContinue
            if ($cmd) { return $cmd.Source }
        } elseif (Test-Path $c) { return $c }
    }
    throw "git not found"
}

$git = Get-GitExe
$safeDir = (Resolve-Path $Root).Path
$GitConfig = @("-c", "safe.directory=$safeDir")

function Invoke-Git {
    param([Parameter(ValueFromRemainingArguments = $true)][string[]]$GitArgs)
    & $git @GitConfig @GitArgs
    if ($LASTEXITCODE -ne 0) { throw "git failed: $($GitArgs -join ' ')" }
}

$status = & $git @GitConfig status --porcelain
if ($status) {
    Invoke-Git add -A
    Invoke-Git -c user.name=sheng -c user.email=sheng@local commit -m $Message
}
Invoke-Git push -u origin $Branch
Write-Host "Pushed to origin/$Branch"

$github = & $git @GitConfig remote get-url github 2>$null
if ($github) {
    $prevSsh = $env:GIT_SSH_COMMAND
    Remove-Item Env:GIT_SSH_COMMAND -ErrorAction SilentlyContinue
    try {
        Invoke-Git push -u github $Branch
        Write-Host "Pushed to github/$Branch"
    } catch {
        Write-Host "GitHub push skipped. Create empty repo gygy/routeros-from-zero-to-pro then retry."
    } finally {
        if ($prevSsh) { $env:GIT_SSH_COMMAND = $prevSsh }
    }
}
