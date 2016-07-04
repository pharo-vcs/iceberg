querying
branch
	LGitGlobal runSequence: [ 
		| repo headReference matcher |
		repo := (LGitRepository on: self location) open.
		^ repo head basename
	]
