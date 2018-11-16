API-commiting
commitWithMessage: message andParents: parentCommits
	
	repository handleLibgitError: [ | signature commitId indexTreeId |
		self addToGitIndex.
		[ signature := self repositoryHandle defaultSignature ]
			on: LGit_GIT_ENOTFOUND, LGit_GIT_ERROR
			do: [ :e | IceGitUsernameOrEmailNotFound guessKind: e ifNot: [ e pass ] ].
		indexTreeId := self repositoryHandle index writeTreeAndReturnOid.
		commitId := (LGitCommitBuilder of: self repositoryHandle)
			tree: (LGitTree of: self repositoryHandle fromId: indexTreeId);
			message: message withUnixLineEndings utf8Encoded asString "FFI is expecting an string";
			parents:
				(self repositoryHandle isUnborn
					ifTrue: [ #() ]
					ifFalse: [ self libGitCommitsFrom: self repositoryHandle for: parentCommits ]);
			"'HEAD' branch could not exist yet. No problem, libgit will create it, 
				but we have to remember it to notify the frontend."
				updateReference:
				([ self repositoryHandle head name ]
					on: LGit_GIT_EUNBORNBRANCH
					do: [ repository branch gitRef ]);
			author: signature;
			committer: signature;
			writeCommit;
			commitId.
		^ repository commitFromGitCommit: (LGitCommit of: self repositoryHandle fromId: commitId)]