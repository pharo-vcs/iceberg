initialize
initializeWithVersion: version
	repository := version repository.
	commit := version commit.
	versions at: version package put: version.