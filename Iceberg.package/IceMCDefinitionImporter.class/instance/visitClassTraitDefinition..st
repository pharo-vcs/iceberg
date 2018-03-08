visiting
visitClassTraitDefinition: aMCClassTraitDefinition 
	| traitDefinitionNode |
	
	traitDefinitionNode := self
		ensureMethodOwnerNamed: aMCClassTraitDefinition className
		isMeta: true
		isTrait: true
		isExtension: false.
	traitDefinitionNode value mcDefinition: aMCClassTraitDefinition.
	
	^ traitDefinitionNode