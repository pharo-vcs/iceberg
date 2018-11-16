tests-fetch
testAfterFetchingARepositoryTracksRemoteBranch

	self repository fetch.
	self assert: self repository remoteTrackedBranches notEmpty