tests
testWorkingCopyHasUnknownCommit
 	
	repository workingCopy initializePackagesFromRepository.
	self assert: repository workingCopy hasUnknownCommit