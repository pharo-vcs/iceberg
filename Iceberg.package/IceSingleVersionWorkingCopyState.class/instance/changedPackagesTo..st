API-changes
changedPackagesTo: aCommitish

	"First we need to calculate all changed packages between the reference commit and the commit we are merging.
	If we don't do this and we only take into account the changes in the modified working copy, we may mess up the merge and bring changes that do not correspond."
	| changedPackagesBetweenCommits |
	changedPackagesBetweenCommits := self referenceCommit changedPackagesTo: aCommitish.

	"Moreover, we need to add to that list of packages the packages we modified locally."
	^ (self workingCopy modifiedPackages, changedPackagesBetweenCommits) asSet