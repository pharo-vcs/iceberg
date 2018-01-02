versions handling
versionLoaded: version 
	workingCopy versionLoaded: version.
	self announcer announce: (IcePackageLoaded version: version).
	self refresh
