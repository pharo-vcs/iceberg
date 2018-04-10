running
setUp
	super setUp.

	packageName := 'IceMockPackage'.
	repository := IceMemoryRepository new.
	repository workingCopy: (IceRingWorkingCopy repository: repository).

	remote := self newRemoteNamed: 'origin'.
	remoteRepository := remote remoteRepository.

	remoteBranchName := 'master'.
	remoteRepository workingCopy addPackageNamed: packageName.
	remoteRepository commitWithMessage: 'Initial commit'.
	repository addRemote: remote.