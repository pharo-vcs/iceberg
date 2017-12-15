testing
canCommit
	
	^ self isDetached not or: [ 
		self incomingCommits notEmpty ]