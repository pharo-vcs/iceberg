versions handling
versionLoaded: version 
	loadedCode := loadedCode versionLoaded: version.
	self announcer announce: (IcePackageLoaded version: version).
	self refresh
