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