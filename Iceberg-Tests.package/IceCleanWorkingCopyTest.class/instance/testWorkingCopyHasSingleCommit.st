tests
testWorkingCopyHasSingleCommit
 
	self repository workingCopy initializePackagesFromRepository.
	self assert: self repository workingCopy hasSingleCommit