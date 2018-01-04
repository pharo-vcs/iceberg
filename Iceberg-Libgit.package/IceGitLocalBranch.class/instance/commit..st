accessing
commit: anIceGitCommit 
	
	repository withRepoDo: [ :repo | | localBranch gitcommit |
		localBranch := repo lookupLocalBranch: self name.
		gitcommit := repo revparse: anIceGitCommit id.
		localBranch setTargetId: gitcommit id ]