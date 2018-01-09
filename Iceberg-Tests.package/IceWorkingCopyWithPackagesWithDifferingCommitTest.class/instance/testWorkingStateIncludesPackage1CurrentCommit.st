tests
testWorkingStateIncludesPackage1CurrentCommit
 	
	repository workingCopy reset.
	self assert: (repository workingCopy workingCopyState includesCommit: self commit1).