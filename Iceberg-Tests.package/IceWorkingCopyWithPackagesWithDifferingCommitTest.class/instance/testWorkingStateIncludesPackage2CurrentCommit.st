tests
testWorkingStateIncludesPackage2CurrentCommit
 	
	repository workingCopy initializePackagesFromRepository.
	self assert: (repository workingCopy workingCopyState includesCommit: self commit2).