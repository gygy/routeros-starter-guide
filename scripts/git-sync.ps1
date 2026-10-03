# Standard git-sync template for new g:\gitea projects (copy to scripts/git-sync.ps1)
param(
    [string]$Message = "chore: sync workspace changes",
    [string]$RepoRoot = (Join-Path $PSScriptRoot "..")
)

$ErrorActionPreference = "Stop"
$Root = (Resolve-Path $RepoRoot).Path
Set-Location $Root

$RemoteUrl = if ($env:GIT_REMOTE) { $env:GIT_REMOTE } else { "ssh://git@192.168.80.3:8022/sheng/routeros-from-zero-to-pro.git" }
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

# GitHub：只推送课程目录 RouterOS入门与精通/（工作区 docs/AGENTS/scripts 禁止上 GitHub）
$github = & $git @GitConfig remote get-url github 2>$null
if ($github) {
    $prevSsh = $env:GIT_SSH_COMMAND
    Remove-Item Env:GIT_SSH_COMMAND -ErrorAction SilentlyContinue
    $prefix = "RouterOS入门与精通"
    try {
        if (-not (Test-Path (Join-Path $Root $prefix))) {
            throw "missing course prefix $prefix"
        }
        $split = & $git @GitConfig subtree split --prefix=$prefix $Branch
        if ($LASTEXITCODE -ne 0 -or -not $split) { throw "git subtree split failed" }
        Invoke-Git push github "${split}:refs/heads/$Branch"
        Write-Host "Pushed course prefix '$prefix' to github/$Branch"
    } catch {
        Write-Host "GitHub push skipped: $($_.Exception.Message)"
        Write-Host "Create empty GitHub repo then retry. Do not push the workspace root."
    } finally {
        if ($prevSsh) { $env:GIT_SSH_COMMAND = $prevSsh }
    }
}
