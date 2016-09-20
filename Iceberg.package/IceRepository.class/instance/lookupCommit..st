private
lookupCommit: commitId
	^ self repository newCommitWalk 
		fromCommitId: commitId; 
		firstCommit
