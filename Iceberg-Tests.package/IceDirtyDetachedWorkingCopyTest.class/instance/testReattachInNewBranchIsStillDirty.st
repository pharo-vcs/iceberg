tests
testReattachInNewBranchIsStillDirty

	self repository createBranch: 'test' inCommit: self repository workingCopy referenceCommit.
	self assert: self repository workingCopy isModified.