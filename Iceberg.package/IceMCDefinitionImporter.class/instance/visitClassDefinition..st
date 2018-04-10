visiting
visitClassDefinition: aMCClassDefinition 
	
	| classDefinitionNode |
	classDefinitionNode := self
		ensureMethodOwnerNamed: aMCClassDefinition className
		isMeta: false
		isTrait: false
		isExtension: false.
	classDefinitionNode value mcDefinition: aMCClassDefinition.
	^ classDefinitionNode