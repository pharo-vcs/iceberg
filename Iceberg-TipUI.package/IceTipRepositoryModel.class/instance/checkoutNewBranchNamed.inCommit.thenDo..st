actions
checkoutNewBranchNamed: aString inCommit: aCommit thenDo: aBlock
	<noCache>

	IceTipStandardAction new 
		repository: self entity;
		message: ('Checking out new branch {1}' format: { aString });
		onSuccessRepositoryModified;
		execute: [ | branch |
			branch := self entity createBranch: aString inCommit: aCommit.
			aBlock value: branch ]