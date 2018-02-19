accessing
childAt: aString ifAbsentPut: aBlock
	
	^ changesDictionary at: aString ifAbsentPut: aBlock