tests-pull
testRepositoryPullFromUnbornBranchThatDoesNotHaveACorrespondingRemoteBranchDoesNothing

	| prePullCommit |
	self repository createBranch: 'temp'.
	
	prePullCommit := self repository head commit.
	self repository pull.
	
	self assert: self repository head commit equals: prePullCommit.