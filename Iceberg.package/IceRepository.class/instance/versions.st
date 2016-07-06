versions handling
versions
	^ versionDescriptors ifNil: [ self loadVersions ]
