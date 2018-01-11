tests-checkout
testLocalBranchTracksRemoteBranchWhenNameMatches

	| remoteTrackedBranch |
	repository fetch.
	
	"We commit to force the creation of the local branch"
	repository workingCopy addPackageNamed: packageName.
	repository commitWithMessage: 'Initial commit'.
	remoteTrackedBranch := repository remoteTrackedBranches anyOne.
	
	
	self assert: remoteTrackedBranch shortname equals: remoteBranchName.
	self assert: (repository branchNamed: remoteBranchName) tracksRemoteBranch.
	self assert: (repository branchNamed: remoteBranchName) trackedBranch equals: remoteTrackedBranch.