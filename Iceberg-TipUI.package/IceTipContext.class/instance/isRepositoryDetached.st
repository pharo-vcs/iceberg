testing
isRepositoryDetached
	^ self repositoryModel isNil 
		or: [ self  repositoryModel isDetached ]