accessing
codeDirectory
	self repositoryDirectory exists ifFalse: [ 
		"Code repository might have been deleted or image might have been moved."
		IceLocalRepositoryMissing signalFor: self frontend
	].

	^ self directory
