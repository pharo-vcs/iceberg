testing
canCommit
	
	^ self head isDetached not and: [ 
		self isDetached not ]