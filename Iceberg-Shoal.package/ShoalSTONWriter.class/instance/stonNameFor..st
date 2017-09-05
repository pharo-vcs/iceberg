accessing
stonNameFor: aClass
	^ self aliases 
		at: aClass 
		ifAbsent: [ aClass stonName ]