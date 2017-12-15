tests-fetch
testRemoteTrackedBranchHasSameNameAsRemoteBranch

	repository fetch.
	self assert: repository remoteTrackedBranches anyOne name equals: remoteBranchName