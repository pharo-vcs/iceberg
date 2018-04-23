running
testFetchFixesUnknownCommit

	repository fetch.
	self deny: repository workingCopy referenceCommit isUnknownCommit.
	self assert: repository workingCopy workingCopyState isSingleCommitState