API-remotes
incomingCommitsFromBranch: aBranch
	
	^ aBranch newCommitWalk
		uptoCommit: self commit;
		commits