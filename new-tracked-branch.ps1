git push --set-upstream originparam (
    [string]$featureBranch
)

if (-not $featureBranch) {
    Write-Host "Usage: new-tracked-branch <feature-branch-name>"
    exit 1
}

git checkout -b $featureBranch
git push --set-upstream origin $featureBranch
