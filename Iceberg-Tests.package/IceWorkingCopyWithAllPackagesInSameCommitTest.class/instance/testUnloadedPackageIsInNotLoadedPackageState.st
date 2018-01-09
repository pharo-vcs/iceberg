tests
testUnloadedPackageIsInNotLoadedPackageState
 	
	repository workingCopy initializePackagesFromRepository.
	(repository packageNamed: packageName1) unload.
		
	self assert: (repository packageNamed: packageName1) packageState isNotLoadedPackageState