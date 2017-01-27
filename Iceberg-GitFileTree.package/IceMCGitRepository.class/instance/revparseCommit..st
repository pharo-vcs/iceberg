querying
revparseCommit: aString 
	^ self newCommitWalk basicFrom: aString; firstCommit 