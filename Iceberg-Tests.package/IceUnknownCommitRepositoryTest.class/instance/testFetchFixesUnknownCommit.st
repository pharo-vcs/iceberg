running
testFetchFixesUnknownCommit

	self repository fetch.
	self deny: self repository workingCopy referenceCommit isUnknownCommit.
	self assert: self repository workingCopy workingCopyState isSingleCommitState