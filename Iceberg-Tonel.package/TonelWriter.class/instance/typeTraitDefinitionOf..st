private definitions
typeTraitDefinitionOf: aClassDefinition
	^ self toSTON: (OrderedDictionary new 
		at: #name put: aClassDefinition className; 
		at: #traits put: aClassDefinition traitCompositionString;
		at: #classTraits put: aClassDefinition classTraitCompositionString;
		at: #category put: aClassDefinition category;
		at: #timestamp put: aClassDefinition commentStamp;
		yourself)	
