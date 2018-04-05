API-remotes
setUpstream: anIceGitRemoteBranch

	repository withRepoDo: [ :repo | | localBranch |
		localBranch := repo lookupLocalBranch: self name.
		localBranch setUpstream: anIceGitRemoteBranch gitRef ]