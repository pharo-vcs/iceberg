tests
testWorkingStateIncludesPackage1CurrentCommit
 	
	repository workingCopy initializePackagesFromRepository.
	self assert: (repository workingCopy workingCopyState includesCommit: self commit1).