running
setUp

	super setUp.
	remoteRepository := self ensureRemoteRepository.
	remote := self newRemoteNamed: 'origin' toRepository: remoteRepository.

	remoteRepository checkoutBranch: self remoteBranchName.
	remoteRepository workingCopy addPackageNamed: self packageName1.
	remoteRepository commitWithMessage: 'Initial commit'.
	
	repository checkoutBranch: self remoteBranchName.
	repository addRemote: remote.