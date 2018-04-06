actions
doAccept
	| newBranch commitish |
	
	commitish := branchCommitish ifNil: [ self model entity workingCopy referenceCommit ].
	IceTipStandardAction new 
		repository: self model entity; 
		message: ('Creating Branch {1} in commit {2}' format: { self branchName. commitish name });
		execute: [ newBranch := self model
			checkoutNewBranchNamed: self branchName
			inCommit: commitish ];
		onSuccessRepositoryModified;
		onSuccess: [ callback ifNotNil: [ callback value: newBranch ] ]