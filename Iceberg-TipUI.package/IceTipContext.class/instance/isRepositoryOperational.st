testing
isRepositoryOperational
	^ self isRepositoryMissing not 
		and: [ self isRepositoryDetached not
			and: [ self hasUnbornProject not ] ]