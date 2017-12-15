running
setUp
	super setUp.

	projectName := 'test-project'.
	packageName1 := 'IceMockPackage'.	
	packageName2 := 'IceOtherMockPackage'.
	remoteFileUrl := (IceLibgitRepository repositoriesLocation / 'remote') asUrl.
	
	repository := IceRepositoryCreator new 
			location: self location / projectName;
			createNewRepositoryNamed: projectName.
	
	repository workingCopy addPackageNamed: packageName1.
	repository workingCopy addPackageNamed: packageName2.
	repository commitWithMessage: 'Initial commit'.