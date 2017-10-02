private definitions
typeTraitDefinitionOf: aClassDefinition
	| definition |
	
	definition := OrderedDictionary new 
		at: #name put: aClassDefinition className; 
		yourself.

	aClassDefinition hasTraitComposition ifTrue: [ 
		definition		
			at: #traits 
			put: aClassDefinition traitCompositionString ].
		
	aClassDefinition hasClassTraitComposition ifTrue: [ 
		definition		
			at: #classTraits 
			put: aClassDefinition classTraitCompositionString ].
	
	definition at: #category put: aClassDefinition category.
		
	^ self toSTON: definition