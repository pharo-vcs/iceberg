private
loadVersionsInBranch: branch
	^ (self repository newCommitWalk
		fromBranch: branch;
		modifyingPackage: self;
		commits)
		collect: [ :commit | commit versionFor: self ]