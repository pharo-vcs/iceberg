querying
incommingCommits
	"Returns only the commits modifying this package."
	^ (self repository newCommitWalk 
		fromHead;
		uptoVersion: self loadedVersion; 
		modifyingPackage: self;
		commits)
		collect: [ :commit | commit versionFor: self ]