actions
doAccept
	| newBranch |
	self validate.
	newBranch := self model
		checkoutNewBranchNamed: self branchName
		inCommit: (branchCommitish ifNil: [ self model entity workingCopy referenceCommit ]).
	callback ifNotNil: [ callback value: newBranch ]