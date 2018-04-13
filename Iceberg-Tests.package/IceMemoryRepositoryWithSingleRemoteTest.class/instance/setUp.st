running
setUp
	super setUp.

	packageName := 'IceMockPackage'.
	repository := IceMemoryRepository new.
	repository workingCopy: (IceRingWorkingCopy repository: repository).

	remote := self newRemoteNamed: 'origin'.
	remoteRepository := remote remoteRepository.

	remoteRepository checkoutBranch: self remoteBranchName.
	remoteRepository workingCopy addPackageNamed: packageName.
	remoteRepository commitWithMessage: 'Initial commit'.
	
	repository checkoutBranch: self remoteBranchName.
	repository addRemote: remote.