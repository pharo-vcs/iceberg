testing
hasIncomingCommitsFrom: aRemote
	
	aRemote fetch.
	^ aRemote hasRemoteBranchNamed: self nameForFirstCommit