visiting
visitTraitDefinition: aMCTraitDefinition 
	
	| traitDefinitionNode |
	traitDefinitionNode := self
		ensureMethodOwnerNamed: aMCTraitDefinition className
		isMeta: false
		isTrait: true
		isExtension: false.
	traitDefinitionNode value mcDefinition: aMCTraitDefinition.
	^ traitDefinitionNode