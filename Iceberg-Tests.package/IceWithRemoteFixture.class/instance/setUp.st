initialization
setUp

	super setUp.
	remoteRepository := self ensureRemoteRepository.
	remote := self newRemoteNamed: 'origin' toRepository: remoteRepository.
	
	remoteBranchName := 'master'.
	remoteRepository workingCopy addPackageNamed: self packageName1.
	remoteRepository commitWithMessage: 'Initial commit'.
	repository addRemote: remote