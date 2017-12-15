running
setUp
	super setUp.

	packageName := 'IceMockPackage'.
	repository := IceMemoryRepository new.
	repository workingCopy addPackageNamed: packageName.
	repository commitWithMessage: 'Local commit'.

	remote := self newRemoteNamed: 'origin'.
	remoteRepository := remote remoteRepository.

	remoteBranchName := 'master'.
	remoteRepository workingCopy addPackageNamed: packageName.
	remoteRepository commitWithMessage: 'Remote commit'.
	repository addRemote: remote.