building
ensureMethodNamed: aString 
	
	^ changesDictionary
		at: aString
		ifAbsentPut: [ 
			IceMethodDiff name: aString parent: self ].