tests
testWorkingStateIncludesPackage2CurrentCommit
 	
	self repository workingCopy initializePackagesFromRepository.
	self assert: (self repository workingCopy workingCopyState includesCommit: self commit2).