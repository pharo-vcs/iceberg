querying
versionFor: package
	^ self loadedVersions 
		at: package 
		ifPresent: #updated
		ifAbsentPut: [ package computeLoadedVersion ]
		
