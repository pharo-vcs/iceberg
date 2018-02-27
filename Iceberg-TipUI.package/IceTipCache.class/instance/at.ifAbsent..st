accessing
at: aKey ifAbsent: anObject
	^ objects 
		at: aKey 
		ifAbsent: anObject