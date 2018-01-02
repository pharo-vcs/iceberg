testing
hasIncomingCommitsFrom: aRemote
	
	| localCommits remoteCommits |
	
	aRemote fetchBranch: self.
	self tracksRemoteBranch
		ifFalse: [ ^ false ].
	
	localCommits := self commits.
	remoteCommits := self trackedBranch commits.
	^ remoteCommits anySatisfy: [ :each |
		(localCommits includes: each) not ]