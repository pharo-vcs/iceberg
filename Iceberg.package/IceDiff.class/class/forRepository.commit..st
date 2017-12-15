instance creation
forRepository: aRepository commit: aCommit
	^ self
		from: aRepository workingCopy
		to: aCommit