actions
commit: versions withMessage: message andMarkAsMerged: aCommitish
	self withRepoDo: [ :repo | 
		| head parentCommits index treeId signature commitId newCommit |
		head := repo head.
		parentCommits := {
			head object.
			LGitCommit of: repo fromHexString: aCommitish id
		}.
		signature := repo defaultSignature.
		
		"versions do: [ :version | index addAll: version directoryName ]"
		index := repo index.
		index addAll.
		treeId := index writeTreeAndReturnOid.
		
		commitId := (LGitCommitBuilder of: repo)
			tree: (LGitTree of: repo fromId: treeId);
			message: message;
			parents: parentCommits;
			updateReference: head;
			author: signature;
			committer: signature;
			writeCommit;
			commitId.
			
		newCommit := self class parseCommitInfo: (LGitCommit of: repo fromId: commitId).
		^ self frontend branch addCommit: newCommit.
	]