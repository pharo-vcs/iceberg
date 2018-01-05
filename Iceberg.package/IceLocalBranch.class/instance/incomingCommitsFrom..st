commits
incomingCommitsFrom: aGitRemote
	
	| remoteBranch |

	remoteBranch := aGitRemote remoteBranchNamed: self name ifAbsent: [ ^ #() ].
	^ remoteBranch newCommitWalk
		uptoCommit: self commit;
		commits