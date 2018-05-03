ancestry
commonAncestorWithCommit: anIceGitCommit
	
	repository handleLibgitError: [ | mergeBaseId |
		mergeBaseId := [ (self repositoryHandle
			mergeBaseBetween: (LGitId fromHexString: self id)
			and: (LGitId fromHexString: anIceGitCommit id)) hexString ]
			on: LGit_GIT_ENOTFOUND
			do: [ nil ].
		^ mergeBaseId ifNotNil: [ self repository lookupCommit: mergeBaseId ] ]