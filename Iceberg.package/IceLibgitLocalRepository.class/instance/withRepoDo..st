auxiliar
withRepoDo: aBlock
	LGitGlobal runSequence: [ 
		| repo |
		repo := (LGitRepository on: self codeDirectory) open.
		aBlock value: repo
	]
