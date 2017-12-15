testing
canCommit
	
	^ self repository isDetached not and: [ 
		referenceCommits includes: self repository head commit ]