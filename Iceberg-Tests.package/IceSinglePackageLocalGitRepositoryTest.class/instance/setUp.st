running
setUp
	super setUp.

	projectName := 'test-project'.
	packageName := 'IceMockPackage'.
	
	remoteFileUrl := (IceLibgitRepository repositoriesLocation / 'remote') asUrl.
	repository := IceRepositoryCreator new 
			location: self location / projectName;
			createNewRepositoryNamed: projectName.
	repository workingCopy: (IceRingWorkingCopy repository: repository).
	
	repository workingCopy addPackageNamed: packageName.
	repository commitWithMessage: 'Initial commit'.