tests-checkout
testLocalBranchDoesNotTrackARemoteBranchBeforeFetching

	"We commit to force the creation of the local branch"
	self repository workingCopy addPackageNamed: self packageName1.
	self repository commitWithMessage: 'Initial commit'.
		
	self deny: (self repository branchNamed: self remoteBranchName) tracksRemoteBranch.