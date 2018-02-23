visiting
visitMetaclassDefinition: aMCClassDefinition 
	
	| classDefinition |
	classDefinition := self
		ensureMethodOwnerNamed: aMCClassDefinition className
		isMeta: true
		isTrait: false
		isExtension: false.
	classDefinition value mcDefinition: aMCClassDefinition.
	^ classDefinition