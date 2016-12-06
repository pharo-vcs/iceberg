tests
testCanGetLibGitCommitFromCommitish
	| committish result |
	committish := repository headCommit.
	repository backend withRepoDo: 
		[ :repo | 
		result := repository backend libGitCommitsFrom: repo for: { committish } ].

	self 
		assert: result first class
		equals: LGitCommit.
		
	self 
		assert: result first id hexString
		equals: committish id 