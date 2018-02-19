visiting
visitClassDefinition: aMCClassDefinition 
	
	| node |
	node := self ensureClassNamed: aMCClassDefinition className isMeta: false.
	diff addOperation: operation forNode: node