API-remotes
setUpstream: anIceGitRemoteBranch
	| localBranch |
	localBranch := self repositoryHandle lookupLocalBranch: self name.
	localBranch setUpstream: anIceGitRemoteBranch gitRef