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

# Merge the PR using GitHub CLI
gh pr merge $prID --merge

if ($?) {
    # Delete local branch
    git branch -d $branchName

    # Delete remote branch
    git push origin --delete $branchName

    # Prune deleted branches
    git fetch --prune
}
else {
    Write-Host "❌ Merge failed. Please check for conflicts or missing permissions."
}

