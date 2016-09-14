events
versionLoaded: version
	self loadedVersions at: version package put: version.

	"Ensure that the working copy points to the right info."
	version package workingCopy versionInfo: version info.	
	