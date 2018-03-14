accessing
withRepoDo: aBlock
	LGitGlobal runSequence: [ 
		aBlock value: self repositoryHandle ]
