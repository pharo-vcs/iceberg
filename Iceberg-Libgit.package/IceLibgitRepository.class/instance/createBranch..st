actions
createBranch: branchName
	[ self
		withRepoDo: [ :repo | 
			| newBranch |
			"This is really low level and may provoke problems.
			Libgit does not provide an API to change branch when the repository is unborn.
			Instead, we replace the HEAD file adding a reference with the new branch.
			
			This may break other existing refs in the repository."
			repo isUnborn
				ifTrue: [ (self location / '.git' / 'HEAD')
						ensureDelete;
						writeStreamDo: [ :stream | stream nextPutAll: 'ref: refs/heads/' , branchName ] ]
				ifFalse: [ newBranch := repo createBranch: branchName target: repo head.
					repo setHead: newBranch ] ] ]
		on: LGit_GIT_EEXISTS
		do: [ :error | 
			IceBranchAlreadyExists new
				branchName: branchName;
				signal ].
	^ self head