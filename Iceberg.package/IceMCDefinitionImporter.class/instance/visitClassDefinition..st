visiting
visitClassDefinition: aMCClassDefinition 
	
	| classDefinitionNode classDefinition |
	classDefinitionNode := self
		ensureMethodOwnerNamed: aMCClassDefinition className
		isMeta: false
		isTrait: false
		isExtension: false.
	classDefinitionNode value mcDefinition: aMCClassDefinition.
	
	"We also generate the definition for the metaclass (See visitMetaclassDefinition: comment)"
	classDefinition := self
		ensureMethodOwnerNamed: aMCClassDefinition className
		isMeta: true
		isTrait: false
		isExtension: false.
	classDefinition value mcDefinition: aMCClassDefinition.
	
	^ classDefinitionNode