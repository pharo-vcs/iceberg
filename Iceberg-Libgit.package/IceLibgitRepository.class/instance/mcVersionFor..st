as yet unclassified
mcVersionFor: iceVersion
	self withRepoDo: [ :repo | 
		[  
			| commit |
			commit := LGitCommit of: repo fromId: (LGitId fromHexString: iceVersion commit id).
			^ (self readerClass
					on: commit
					iceVersion: iceVersion) 
					version ] 
		on: IceMissingRepositoryEntry, LGit_GIT_ENOTFOUND
		do: [ 
			IceVersionDoesNotExist new 
				version: iceVersion; 
				signal ] ]
