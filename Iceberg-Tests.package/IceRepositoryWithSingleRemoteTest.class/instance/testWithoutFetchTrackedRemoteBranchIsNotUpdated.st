tests-fetch
testWithoutFetchTrackedRemoteBranchIsNotUpdated

	| newCommit |
	self repository fetch.
	
	self remoteRepository checkoutAllPackages.
	self remoteRepository workingCopy addPackageNamed: 'AnotherPackage'.
	newCommit := self remoteRepository commitWithMessage: 'Another commit message'.
	
	self assert: self repository remoteTrackedBranches anyOne commit equals: newCommit ancestors anyOne