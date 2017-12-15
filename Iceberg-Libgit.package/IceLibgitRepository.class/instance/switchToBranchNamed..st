branches
switchToBranchNamed: branchName

	[self withRepoDo: [ :repo |
		repo checkout: branchName ]]
		on: LGit_GIT_ENOTFOUND
		do: [ :error | IceBranchNotFound new
				branchName: branchName;
				signal ].
	^ self head