private
lookupVersionsOfPackage: package inBranch: branchName
	^ IceMCGitFileTreeCommitImporter new 
		repository: self;
		package: package;
		branchName: branchName;
		getVersions