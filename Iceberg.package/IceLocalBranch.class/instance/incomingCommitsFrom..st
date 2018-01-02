commits
incomingCommitsFrom: aGitRemote
	
	| remoteBranch |
	aGitRemote fetchBranch: self.
	remoteBranch := aGitRemote remoteBranchNamed: self name ifAbsent: [ ^ #() ].
	^ remoteBranch newCommitWalk
		uptoCommit: self commit;
		commits