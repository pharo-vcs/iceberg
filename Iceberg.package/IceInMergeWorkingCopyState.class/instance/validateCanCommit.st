validating
validateCanCommit
	
	mergeCommits first = repository head commit
		ifFalse: [ IceWorkingCopyDesyncronized signal ]