API-commiting
commitWithMessage: message andParents: parentCommits

	self addToGitIndex.
	repository withRepoDo: [ :repo | 
		| signature commitId indexTreeId |
		[ signature := repo defaultSignature ]
		on: LGit_GIT_ENOTFOUND do: [ :e | 
			IceGitUsernameOrEmailNotFound guessKind: e ifNot: [ e pass ] ].
		indexTreeId := repo index writeTreeAndReturnOid.		 
		commitId := (LGitCommitBuilder of: repo)
			tree: (LGitTree of: repo fromId: indexTreeId);
			message: message withUnixLineEndings utf8Encoded;
			parents: (repo isUnborn
				ifTrue: [ #() ]
				ifFalse: [ self libGitCommitsFrom: repo for: parentCommits ]);
			"'HEAD' branch could not exist yet. No problem, libgit will create it, 
			but we have to remember it to notify the frontend."
			updateReference: ([ repo head name ] 
				on: LGit_GIT_EUNBORNBRANCH
				do: [ 'refs/heads/', repository branch nameForFirstCommit ]);
			author: signature;
			committer: signature;
			writeCommit;
			commitId.
		^ repository commitFromGitCommit: (LGitCommit of: repo fromId: commitId) ]