tests-fetch
testRemoteTrackedBranchHasSameNameAsRemoteBranch

	self repository fetch.
	self assert: self repository remoteTrackedBranches anyOne shortname equals: self remoteBranchName