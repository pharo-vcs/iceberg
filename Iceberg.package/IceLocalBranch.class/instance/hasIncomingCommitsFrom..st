API-remotes
hasIncomingCommitsFrom: aRemote
	
	| localCommits remoteCommits |
	self tracksRemoteBranch
		ifFalse: [ ^ false ].
	
	localCommits := self commits.
	remoteCommits := self trackedBranch commits.
	^ remoteCommits anySatisfy: [ :each |
		(localCommits includes: each) not ]