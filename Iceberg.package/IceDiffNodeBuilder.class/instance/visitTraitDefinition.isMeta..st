visiting
visitTraitDefinition: aMCTraitDefinition isMeta: isMeta
	
	| node |
	node := self ensureTraitNamed: aMCTraitDefinition className isMeta: isMeta.
	diff addOperation: operation forNode: node