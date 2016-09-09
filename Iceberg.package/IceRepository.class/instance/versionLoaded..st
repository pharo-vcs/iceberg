versions handling
versionLoaded: anIcePackageVersion 
	loadedCode := loadedCode updatedWith: anIcePackageVersion.
	self announcer announce: (IcePackageLoaded version: anIcePackageVersion).
	self refresh
