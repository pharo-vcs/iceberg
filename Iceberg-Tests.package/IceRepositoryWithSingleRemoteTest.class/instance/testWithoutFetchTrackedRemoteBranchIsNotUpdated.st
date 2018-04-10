tests-fetch
testWithoutFetchTrackedRemoteBranchIsNotUpdated

	| newCommit |
	repository fetch.
	
	remoteRepository checkoutAllPackages.
	remoteRepository workingCopy addPackageNamed: 'AnotherPackage'.
	newCommit := remoteRepository commitWithMessage: 'Another commit message'.
	
	self assert: repository remoteTrackedBranches anyOne commit equals: newCommit ancestors anyOne