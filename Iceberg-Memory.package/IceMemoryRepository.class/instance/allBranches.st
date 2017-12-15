branches
allBranches
	
	^ self latestMCCommits collect: [ :latestVersion |
			(IceMemoryLocalBranch new
				name: latestVersion package name;
				repository: self;
				commit: (IceMemoryCommit new
					repository: self;
					mcCommit: latestVersion;
					yourself);
				yourself)						
			yourself ]