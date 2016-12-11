actions
commitIndexWithMessage: message andParents: parentCommitishList

	self withRepoDo: [ :repo | 
		| signature commitId indexTreeId |
		signature := repo defaultSignature.			
		indexTreeId := repo index writeTreeAndReturnOid.		 
		commitId := (LGitCommitBuilder of: repo)
			tree: (LGitTree of: repo fromId: indexTreeId);
			message: message;
			parents: (self libGitCommitsFrom: repo for: parentCommitishList);
			updateReference: repo head name;
			author: signature;
			committer: signature;
			writeCommit;
			commitId.
			
		 ^ self class parseCommitInfo: (LGitCommit of: repo fromId: commitId).
	]