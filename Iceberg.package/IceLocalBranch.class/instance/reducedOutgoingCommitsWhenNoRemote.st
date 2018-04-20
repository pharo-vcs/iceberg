API-remotes
reducedOutgoingCommitsWhenNoRemote
	^ self newCommitWalk
		maxNumber: 20;
		commits