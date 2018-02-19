building
buildDirectoryNamed: aString 
	
	^ changesDictionary at: aString ifAbsentPut: [ 
		IceDirectoryNode
			named: aString
			parent: self ].