testing
isMissing
	^ self repositoryDirectory isNil 
		or: [ self repositoryDirectory exists not ]