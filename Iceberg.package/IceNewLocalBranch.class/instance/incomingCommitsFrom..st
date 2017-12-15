commits
incomingCommitsFrom: aGitRemote
	
	| remoteBranch |
	aGitRemote fetchBranch: self.
	remoteBranch := aGitRemote remoteBranchNamed: self name.
	^ remoteBranch newCommitWalk
		uptoCommit: self commit;
		commits