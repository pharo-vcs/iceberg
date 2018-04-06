actions
doAccept
	self validate.
	self model
		checkoutNewBranchNamed: self branchName
		inCommit: (branchCommitish ifNil: [ self model entity workingCopy referenceCommit ])
		thenDo: [ :newBranch | callback ifNotNil: [ callback value: newBranch ] ]