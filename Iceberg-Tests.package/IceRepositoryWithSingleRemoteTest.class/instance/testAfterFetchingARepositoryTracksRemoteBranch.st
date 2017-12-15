tests-fetch
testAfterFetchingARepositoryTracksRemoteBranch

	repository fetch.
	self assert: repository remoteTrackedBranches notEmpty