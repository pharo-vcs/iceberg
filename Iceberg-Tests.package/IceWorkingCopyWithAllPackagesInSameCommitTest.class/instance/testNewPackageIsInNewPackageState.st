tests
testNewPackageIsInNewPackageState
 	
	repository workingCopy initializePackagesFromRepository.
	repository workingCopy addPackageNamed: 'NewPackage'.
	
	self assert: (repository packageNamed: 'NewPackage') packageState isNewPackageState