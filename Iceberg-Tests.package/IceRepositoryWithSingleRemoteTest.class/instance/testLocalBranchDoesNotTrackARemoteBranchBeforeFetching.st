tests-checkout
testLocalBranchDoesNotTrackARemoteBranchBeforeFetching

	"We commit to force the creation of the local branch"
	repository workingCopy addPackageNamed: packageName.
	repository commitWithMessage: 'Initial commit'.
		
	self deny: (repository branchNamed: remoteBranchName) tracksRemoteBranch.