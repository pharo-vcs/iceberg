branches
remoteBranchNamed: aName ifPresent: presentBlock ifAbsent: absentBlock 

	^ self
		latestMCVersionForBranchNamed: aName
		ifPresent: [ :latestVersion | 
			presentBlock value: (IceMemoryRemoteBranch new
				name: latestVersion package name;
				repository: localRepository;
				commit: (IceMemoryCommit new
					repository: localRepository;
					mcCommit: latestVersion;
					yourself);
				remote: self;
				yourself) ]
		ifAbsent: absentBlock