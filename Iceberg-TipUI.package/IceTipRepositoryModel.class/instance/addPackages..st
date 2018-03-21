actions
addPackages: aCollection 
	IceTipAddPackageAction new 
		repository: self entity;
		packages: aCollection;
		execute