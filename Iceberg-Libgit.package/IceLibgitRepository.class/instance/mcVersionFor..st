as yet unclassified
mcVersionFor: iceVersion
	self withRepoDo: [ :repo | 
		| commit |
		commit := LGitCommit of: repo fromId: (LGitId fromHexString: iceVersion commit id).

		[ ^ (self readerClass
				on: commit
				iceVersion: iceVersion) 
				version ] 
			on: IceMissingRepositoryEntry 
			do: [ IceVersionDoesNotExist new version: iceVersion; signal ]
	]
