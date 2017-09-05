private definitions
typeDefinitionOf: aClassDefinition
	(self isTrait: aClassDefinition) 
		ifTrue: [ ^ self typeTraitDefinitionOf: aClassDefinition ].
	^ self typeClassDefinitionOf: aClassDefinition