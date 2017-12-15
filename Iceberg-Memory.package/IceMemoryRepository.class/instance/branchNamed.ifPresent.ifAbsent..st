branches
branchNamed: aName ifPresent: presentBlock ifAbsent: absentBlock
	
	^ self
		latestMCVersionForBranchNamed: aName
		ifPresent:  [ :latestVersion | 
			^ IceMemoryLocalBranch new
				name: latestVersion package name;
				repository: self;
				commit: (IceMemoryCommit new
					repository: self;
					mcCommit: latestVersion;
					yourself);
				yourself ]
		ifAbsent: absentBlock
		inBranchMCRepository: branchRepository