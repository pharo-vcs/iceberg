branches
branches
	
	^ (self latestCommitsOf: branchRepository)
		collect: [ :latestVersion |
			(IceMemoryRemoteBranch new
				name: latestVersion package name;
				repository: localRepository;
				commit: (IceMemoryCommit new
					repository: localRepository;
					mcCommit: latestVersion;
					yourself);
				remote: self;
				yourself)						
			yourself ]