accessing
childrenToShowFrom: aDirectory
	
	^ (aDirectory children select: [ :each |
		each isDirectory and: [ (each basename beginsWith: '.') not ] ])
			sort: [ :a :b | a basename < b basename ]