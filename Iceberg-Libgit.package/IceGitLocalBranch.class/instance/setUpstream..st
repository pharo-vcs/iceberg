API-remotes
setUpstream: anIceGitRemoteBranch
	
	repository handleLibgitError: [ | localBranch |
		localBranch := self repositoryHandle lookupLocalBranch: self name.
		localBranch setUpstream: anIceGitRemoteBranch gitRef ]