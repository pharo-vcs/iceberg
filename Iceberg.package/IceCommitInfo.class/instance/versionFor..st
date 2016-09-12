querying
versionFor: package
	^ IceSavedPackageVersion new 
		package: package;
		updationCommit: self;
		yourself