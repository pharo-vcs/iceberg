tests
testWorkingCopyIsNotUnknownCommot
 	
	self repository workingCopy initializePackagesFromRepository.
	self deny: self repository workingCopy hasUnknownCommit