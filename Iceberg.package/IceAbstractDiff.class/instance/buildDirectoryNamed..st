building
buildDirectoryNamed: aString 
	
	^ changesDictionary at: aString ifAbsentPut: [ 
		IceDirectoryDiff
			named: aString
			parent: self ].