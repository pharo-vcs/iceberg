ancestry
commonAncestorWithCommit: anIceGitCommit 
	
	self repository withRepoDo: [ :repo | | mergeBaseId |
		mergeBaseId := [(repo 
				mergeBaseBetween: (LGitId fromHexString: self id) 
				and: (LGitId fromHexString: anIceGitCommit id)) 
				hexString ] 
					on: LGit_GIT_ENOTFOUND
					do: [ nil ].
		^ mergeBaseId
			ifNotNil: [ self repository lookupCommit: mergeBaseId ] ]