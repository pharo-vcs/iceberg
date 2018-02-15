building
buildFileNamed: aString 
	
	^ changesDictionary at: aString ifAbsentPut: [ 
		IceFileDiff
			named: aString
			parent: self ].