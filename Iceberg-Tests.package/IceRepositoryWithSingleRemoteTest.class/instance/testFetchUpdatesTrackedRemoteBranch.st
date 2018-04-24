tests-fetch
testFetchUpdatesTrackedRemoteBranch

	| newCommit remoteTrackedBranches |
	self remoteRepository workingCopy addPackageNamed: 'AnotherPackage'.
	newCommit := self remoteRepository commitWithMessage: 'Another commit message'.
	
	self repository fetch.
	remoteTrackedBranches := self repository remoteTrackedBranches.
	self assert: remoteTrackedBranches size equals: 1.
	self assert: self repository remoteTrackedBranches anyOne commit equals: newCommit