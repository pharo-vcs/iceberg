running
setUp
	super setUp.
	projectName := 'test-project'.
	packageName1 := 'IceMockPackage1'.
	packageName2 := 'IceMockPackage2'.
	
	repository := IceRepositoryCreator new 
			location: self location / projectName;
			createNewRepositoryNamed: projectName.
	repository workingCopy: (IceRingWorkingCopy repository: repository).

	repository workingCopy addPackageNamed: packageName1.
	repository workingCopy addPackageNamed: packageName2.
	repository commitWithMessage: 'Local commit'.
	repository checkout.