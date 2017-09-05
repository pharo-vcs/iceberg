private definitions
typeClassDefinitionOf: aClassDefinition
	| definition |
	
	definition := OrderedDictionary new 
		at: #name put: aClassDefinition className; 
		at: #superclass put: aClassDefinition superclassName;
		yourself.

	aClassDefinition hasTraitComposition ifTrue: [ 
		definition	
			at: #traits put: aClassDefinition traitCompositionString;
			at: #classTraits put: aClassDefinition classTraitCompositionString ].
	
	(aClassDefinition variables select: #isInstanceVariable thenCollect: #name)
		ifNotEmpty: [ :vars | definition at: #instVars put: vars asArray ].

	(aClassDefinition variables select: #isClassVariable thenCollect: #name)
		ifNotEmpty: [ :vars | definition at: #classVars put: vars asArray ].
		
	(aClassDefinition variables select: #isPoolImport thenCollect: #name)
		ifNotEmpty: [ :vars | definition at: #poolVars put: vars asArray ].
		
	definition 		
		at: #category put: aClassDefinition category;
		at: #timestamp put: aClassDefinition commentStamp.
	
	^ self toSTON: definition