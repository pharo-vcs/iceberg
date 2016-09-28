private
doCommit: versions withMessage: message andParents: parentCommitsBlock
	self withRepoDo: [ :repo | 
		| index treeId signature commitId newCommit |
		signature := repo defaultSignature.
		
		"versions do: [ :version | index addAll: version directoryName ]"
		index := repo index.
		index addAll: (versions collect: [ :version | self directoryForPackage: version package]).
		treeId := index writeTreeAndReturnOid.
		
		commitId := (LGitCommitBuilder of: repo)
			tree: (LGitTree of: repo fromId: treeId);
			message: message;
			parents: (parentCommitsBlock value: repo);
			updateReference: repo head;
			author: signature;
			committer: signature;
			writeCommit;
			commitId.
			
		newCommit := self class parseCommitInfo: (LGitCommit of: repo fromId: commitId).
		^ self frontend branch addCommit: newCommit.
	]