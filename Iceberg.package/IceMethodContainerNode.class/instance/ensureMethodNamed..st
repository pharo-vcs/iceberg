building
ensureMethodNamed: aString 
	
	^ changesDictionary
		at: aString
		ifAbsentPut: [ 
			IceMethodNode name: aString parent: self ].