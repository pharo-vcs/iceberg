tests-fetch
testFetchUpdatesTrackedRemoteBranch

	| newCommit remoteTrackedBranches |
	remoteRepository workingCopy addPackageNamed: 'AnotherPackage'.
	newCommit := remoteRepository commitWithMessage: 'Another commit message'.
	
	repository fetch.
	remoteTrackedBranches := repository remoteTrackedBranches.
	self assert: remoteTrackedBranches size equals: 1.
	self assert: repository remoteTrackedBranches anyOne commit equals: newCommit