commits
outgoingCommitsTo: aRemote
	
	| remoteBranch |
	aRemote fetchBranch: self.
	remoteBranch := aRemote remoteBranchNamed: self name.
	^ self newCommitWalk
		uptoCommit: remoteBranch commit;
		commits