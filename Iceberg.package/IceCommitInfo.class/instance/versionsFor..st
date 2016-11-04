querying
versionsFor: package
	"Returns only the commits modifying this package."
	^ (self repository newCommitWalk 
		fromCommit: self;
		modifyingPackage: package;
		commits)
		collect: [ :commit | commit versionFor: package ]