building
buildFileNamed: aString 
	
	^ changesDictionary at: aString ifAbsentPut: [ 
		IceFileNode
			named: aString
			parent: self ].