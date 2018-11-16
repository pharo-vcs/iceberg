API-remotes
hasOutgoingCommitsTo: aRemote
	
	| localCommits remoteCommits |
	self tracksRemoteBranch
		ifFalse: [ ^ false ].
	
	localCommits := self commits.
	remoteCommits := self trackedBranch commits.
	^ localCommits anySatisfy: [ :each |
		(remoteCommits includes: each) not ]