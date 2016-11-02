querying
versionFor: package 
	^ self loadedVersions 
		at: package 
		ifPresent: #updatedVersion
		ifAbsent: [ self loadedVersions at: package put: package computeLoadedVersion ]
		
