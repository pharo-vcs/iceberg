querying
incommingVersions
	^ (self repository newCommitWalk 
		fromHead;
		uptoCommits: { self loadedVersion commit }; 
		modifyingPackage: self;
		commits)
		collect: [ :commit | commit versionFor: self ]