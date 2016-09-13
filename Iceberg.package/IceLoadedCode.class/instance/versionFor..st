as yet unclassified
versionFor: package 
	^ self loadedVersions at: package ifAbsentPut: [ package computeLoadedVersion ]
