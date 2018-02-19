accessing
targetVersionOf: aNode
	
	^ operations at: aNode
		ifPresent: #diffFromSource
		ifAbsent: [ '' ]