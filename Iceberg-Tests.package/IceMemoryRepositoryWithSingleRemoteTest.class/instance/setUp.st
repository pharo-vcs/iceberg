running
setUp
	super setUp.

	packageName := 'IceMockPackage'.
	repository := IceMemoryRepository new.

	remote := self newRemoteNamed: 'origin'.
	remoteRepository := remote remoteRepository.

	remoteBranchName := 'master'.
	remoteRepository workingCopy addPackageNamed: packageName.
	remoteRepository commitWithMessage: 'Initial commit'.
	repository addRemote: remote.