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

	remote := self newRemoteNamed: 'origin'.
	
	remoteBranchName := 'master'.
	remoteRepository workingCopy addPackageNamed: packageName.
	remoteRepository commitWithMessage: 'Initial commit'.
	repository addRemote: remote.