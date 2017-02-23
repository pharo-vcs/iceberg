private
doCommit: versions withMessage: message andParents: parentCommitsBlock
	self withRepoDo: [ :repo | 
		| index treeId signature commitId branchIsNew |
		signature := repo defaultSignature.
		
		"versions do: [ :version | index addAll: version directoryName ]"
		index := repo index.
		index addAll: (versions collect: [ :version | self directoryForPackage: version package]).
		index writeToDisk.

		treeId := index writeTreeAndReturnOid.

		commitId := (LGitCommitBuilder of: repo)
			tree: (LGitTree of: repo fromId: treeId);
			message: message;
			parents: (parentCommitsBlock value: repo);

			"'HEAD' branch could not exist yet. No problem, libgit will create it, 
			but we have to remember it to notify the frontend."
			updateReference: ([ branchIsNew := false. repo head name ] 
				on: LGit_GIT_EUNBORNBRANCH
				do: [ branchIsNew := true. 'refs/heads/', self branch nameForFirstCommit ]);
			author: signature;
			committer: signature;
			writeCommit;
			commitId.
		
		branchIsNew ifTrue: [ self branch: self lookupHead ].
			
		 ^ self class parseCommitInfo: (LGitCommit of: repo fromId: commitId).
	]