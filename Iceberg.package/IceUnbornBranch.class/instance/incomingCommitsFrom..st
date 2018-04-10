API-remotes
incomingCommitsFrom: aRemote
	| remoteBranch |
	remoteBranch := aRemote remoteBranchNamed: self name ifAbsent: [ ^ #() ].
	^ remoteBranch newCommitWalk
		uptoCommit: self commit;
		commits