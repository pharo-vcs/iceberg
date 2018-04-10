branches
remoteBranchNamed: aString ifAbsent: aBlock
	
	^ self
		remoteBranchNamed: aString
		ifPresent: [ :branch | ^ branch ]
		ifAbsent: [ ^ aBlock value ]