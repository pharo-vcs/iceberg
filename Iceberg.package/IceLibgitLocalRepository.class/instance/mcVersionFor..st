patches
mcVersionFor: iceVersion
	self withRepoDo: [ :repo | 
		| commit |
		commit := LGitCommit of: repo fromId: (LGitId fromHexString: iceVersion commitId).

		^ (IceLibgitVersionReader 
			on: commit
			iceVersion: iceVersion) version
	]
