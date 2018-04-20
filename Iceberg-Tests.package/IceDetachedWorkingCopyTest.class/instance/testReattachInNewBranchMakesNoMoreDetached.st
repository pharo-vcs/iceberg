tests
testReattachInNewBranchMakesNoMoreDetached

	self repository createBranch: 'test' inCommit: self repository workingCopy referenceCommit.
	self deny: self repository workingCopy isDetached.