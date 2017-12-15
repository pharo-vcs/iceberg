private
lookupCommit: commitId

	^ self newCommitWalk 
		fromCommitId: commitId; 
		firstCommit
