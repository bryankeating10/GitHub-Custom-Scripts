git push --set-upstream originparam (
    [string]$featureBranch
)

if (-not $featureBranch) {
    Write-Host "Usage: new-tracked-branch <feature-branch-name>"
    exit 1
}

Write-Host "Switching to feature branch"
git checkout -b $featureBranch

Write-Host "Setting upstream origin"
git push --set-upstream origin $featureBranch
