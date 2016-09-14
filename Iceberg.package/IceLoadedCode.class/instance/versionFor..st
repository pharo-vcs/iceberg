querying
versionFor: package 
	^ self loadedVersions at: package ifAbsentPut: [ package computeLoadedVersion ]
