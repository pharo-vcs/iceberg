actions
commit: versions withMessage: message
	| commitId |
	self withRepoDo: [ :repo | 
		| head parentCommit index treeId signature |
		head := repo head.
		parentCommit := head object.
		signature := repo defaultSignature.
		
		"versions do: [ :version | index addAll: version directoryName ]"
		index := repo index.
		index addAll.
		treeId := index  writeTreeAndReturnOid.
		
		commitId := (LGitCommitBuilder of: repo)
			tree: (LGitTree of: repo fromId: treeId);
			message: message;
			parents: { parentCommit };
			updateReference: head;
			author: signature;
			committer: signature;
			writeCommit;
			commitId.
			
		^ self class parseCommitInfo: (LGitCommit of: repo fromId: commitId)
	]
