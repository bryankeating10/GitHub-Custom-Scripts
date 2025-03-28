param (
    [string]$prID
)

if (-not $prID) {
    Write-Host "Usage: merge-and-cleanup <PR-ID>"
    exit 1
}

# Get the branch name associated with the PR
$branchName = gh pr view $prID --json headRefName --jq ".headRefName"

if (-not $branchName) {
    Write-Host "❌ Could not determine branch name from PR ID '$prID'."
    exit 1
}

Write-Host "Merging PR #$prID for branch '$branchName'..."

# Merge the PR using GitHub CLI
gh pr merge $prID --merge

if ($?) {
    # Delete local branch
    Write-Host "Deleting local branch '$branchName'..."
    git branch -d $branchName

    # Delete remote branch
    Write-Host "Deleting remote branch '$branchName'..."
    git push origin --delete $branchName

    # Prune deleted branches
    Write-Host "Pruning deleted remote branches..."
    git fetch --prune

    Write-Host "✅ Merge complete and cleanup done!"
} else {
    Write-Host "❌ Merge failed. Please check for conflicts or missing permissions."
}

