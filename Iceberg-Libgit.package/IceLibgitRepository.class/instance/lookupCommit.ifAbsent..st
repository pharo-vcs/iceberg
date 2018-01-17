accessing
lookupCommit: commitId ifAbsent: aBlock

	^ [
		self newCommitWalk 
			fromCommitId: commitId; 
			firstCommit ]
				on: LGit_GIT_ENOTFOUND
				do: aBlock