tests-fetch
testRemoteTrackedBranchHasSameNameAsRemoteBranch

	repository fetch.
	self assert: repository remoteTrackedBranches anyOne shortname equals: remoteBranchName