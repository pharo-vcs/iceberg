tests-fetch
testWithoutFetchTrackedRemoteBranchIsNotUpdated

	| newCommit |
	repository fetch.
	
	remoteRepository checkout.
	remoteRepository workingCopy addPackageNamed: 'AnotherPackage'.
	newCommit := remoteRepository commitWithMessage: 'Another commit message'.
	
	self assert: repository remoteTrackedBranches anyOne commit equals: newCommit ancestors anyOne