remote-branches
remoteBranchNamed: aName ifPresent: presentBlock ifAbsent: absentBlock 

	self halt.
	^ self
		latestMCVersionForBranchNamed: aName
		ifPresent: [ :latestVersion | 
			^ IceMemoryRemoteBranch new
				name: latestVersion package name;
				repository: self;
				commit: (IceMemoryCommit new
					repository: self;
					mcCommit: latestVersion;
					yourself);
				yourself ]
		ifAbsent: absentBlock
		inBranchMCRepository: remoteBranchRepository