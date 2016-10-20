querying
versionFor: package 
	^ self loadedVersions 
		at: package 
		ifPresent: #updatedVersion
		ifAbsentPut: [ package computeLoadedVersion ]
		
