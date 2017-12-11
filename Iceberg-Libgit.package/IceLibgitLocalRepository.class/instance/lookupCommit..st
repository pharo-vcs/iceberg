accessing
lookupCommit: commitId
	^ [self newCommitWalk 
		fromCommitId: commitId; 
		firstCommit]
		on: LGit_GIT_ENOTFOUND do: [ :e |
			"It may happen commit is not found (because is in another branch, etc.)"
			nil ]
