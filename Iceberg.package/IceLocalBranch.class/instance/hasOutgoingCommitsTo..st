testing
hasOutgoingCommitsTo: aRemote
	
	| localCommits remoteCommits |
	
	aRemote fetchBranch: self.
	self tracksRemoteBranch
		ifFalse: [ ^ false ].
	
	localCommits := self commits.
	remoteCommits := self trackedBranch commits.
	^ localCommits anySatisfy: [ :each |
		(remoteCommits includes: each) not ]