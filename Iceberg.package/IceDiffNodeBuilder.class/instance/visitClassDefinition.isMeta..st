visiting
visitClassDefinition: aMCClassDefinition isMeta: aBoolean
	
	| node |
	node := self ensureClassNamed: aMCClassDefinition className isMeta: aBoolean.
	diff addOperation: operation forNode: node