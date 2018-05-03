testing
isRepositoryMissing
	^ self repositoryModel isMissing or: [ self repositoryModel isCodeMissing ]