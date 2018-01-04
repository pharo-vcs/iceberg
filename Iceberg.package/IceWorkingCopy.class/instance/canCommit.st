testing
canCommit
	
	^ self repository head isDetached not and: [ 
		self isDetached not ]