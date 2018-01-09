tests
testWorkingStateIncludesPackage2CurrentCommit
 	
	repository workingCopy reset.
	self assert: (repository workingCopy workingCopyState includesCommit: self commit2).