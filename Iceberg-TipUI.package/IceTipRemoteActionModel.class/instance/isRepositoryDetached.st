testing
isRepositoryDetached
	^ self entity workingCopy isDetached 
		or: [ self entity head isDetached ]