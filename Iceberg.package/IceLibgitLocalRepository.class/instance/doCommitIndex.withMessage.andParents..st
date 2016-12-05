private
doCommitIndex: indexTreeId withMessage: message andParents: parentCommitsBlock
	self withRepoDo: [ :repo | 
		| signature commitId |
		signature := repo defaultSignature.
			
		commitId := (LGitCommitBuilder of: repo)
			tree: (LGitTree of: repo fromId: indexTreeId);
			message: message;
			parents: (parentCommitsBlock value: repo);
			updateReference: repo head;
			author: signature;
			committer: signature;
			writeCommit;
			commitId.
			
		 ^ self class parseCommitInfo: (LGitCommit of: repo fromId: commitId).
	]