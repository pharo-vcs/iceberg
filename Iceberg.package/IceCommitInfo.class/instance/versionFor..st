querying
versionFor: package 
	^ IceSavedPackageVersion new 
		package: package;
		commitId: self id;
		info: (IceMCVersionInfo new fromCommit: self package: package);
		yourself