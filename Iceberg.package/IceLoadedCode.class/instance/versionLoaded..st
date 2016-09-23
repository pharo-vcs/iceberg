events
versionLoaded: version
	self loadedVersions at: version package put: version.
	version beCurrent
	