visiting
visitClassTraitDefinition: aMCClassTraitDefinition 

	| classTraitDefinitionNode |
	classTraitDefinitionNode := self
		ensureMethodOwnerNamed: aMCClassTraitDefinition className
		isMeta: true
		isTrait: true
		isExtension: false.
	classTraitDefinitionNode value mcDefinition: aMCClassTraitDefinition.
	^ classTraitDefinitionNode