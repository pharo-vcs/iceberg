visiting
visitClassTraitDefinition: aMCClassTraitDefinition 
	| traitDefinitionNode |
	
	traitDefinitionNode := self
		ensureMethodOwnerNamed: aMCClassTraitDefinition className
		isMeta: false
		isTrait: false
		isExtension: false.
	traitDefinitionNode value mcDefinition: aMCClassTraitDefinition.
	
	^ traitDefinitionNode