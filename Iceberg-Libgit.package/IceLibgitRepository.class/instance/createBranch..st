actions
createBranch: branchName
	[self withRepoDo: [ :repo |
		| newBranch |
		newBranch := repo createBranch: branchName target: repo head.
		repo setHead: newBranch ]]
			on: LGit_GIT_EEXISTS
			do: [ :error | 
				IceBranchAlreadyExists new
					branchName: branchName;
					signal ].
	^ self head