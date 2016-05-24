repository handling
createRepository
	^ IceMCGitRepository new
		localRepository: self location;
		remoteUrl: self origin url;
		"subdirectory: '';"
		readonly: false.
