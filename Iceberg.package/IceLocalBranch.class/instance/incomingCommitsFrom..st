commits
incomingCommitsFrom: aRemote 
	^ (self upstreamFor: aRemote) commitsNotIn: self