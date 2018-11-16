tests-pull
testRepositoryPullFromBranchThatDoesNotHaveACorrespondingRemoteBranchDoesNothing

	| prePullCommit |
	self repository createBranch: 'temp'.
	self repository workingCopy addPackageNamed: 'AnotherPackage'.
	prePullCommit := self repository commitWithMessage: 'Another commit message'.
	
	self repository pullFrom: self remote.
	
	self assert: self repository head commit equals: prePullCommit.