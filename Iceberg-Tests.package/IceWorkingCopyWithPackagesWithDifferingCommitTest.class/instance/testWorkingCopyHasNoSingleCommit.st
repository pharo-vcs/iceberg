tests
testWorkingCopyHasNoSingleCommit
 	
	repository workingCopy initializePackagesFromRepository.
	self deny: repository workingCopy hasSingleCommit