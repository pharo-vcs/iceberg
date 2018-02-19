accessing
sourceVersionOf: aNode
	
	^ operations at: aNode
		ifPresent: #diffToSource
		ifAbsent: [ '' ]