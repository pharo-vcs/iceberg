private definitions
typeClassDefinitionOf: aClassDefinition
	| definition |
	
	definition := OrderedDictionary new 
		at: #name put: aClassDefinition className; 
		at: #superclass put: aClassDefinition superclassName;
		yourself.

	aClassDefinition type = #normal ifFalse: [ 
		definition at: #type put: aClassDefinition type ].
	
	aClassDefinition hasTraitComposition ifTrue: [ 
		definition at: #traits put: aClassDefinition traitCompositionString ].
	
	aClassDefinition hasClassTraitComposition ifTrue: [ 
		definition at: #classTraits put: aClassDefinition classTraitCompositionString ].
	
	(aClassDefinition variables select: #isInstanceVariable thenCollect: #name)
		ifNotEmpty: [ :vars | definition at: #instVars put: vars asArray ].

	(aClassDefinition variables select: #isClassVariable thenCollect: #name)
		ifNotEmpty: [ :vars | definition at: #classVars put: vars asArray ].
		
	(aClassDefinition variables select: #isPoolImport thenCollect: #name)
		ifNotEmpty: [ :vars | definition at: #pools put: vars asArray ].
		
	(aClassDefinition variables select: #isClassInstanceVariable thenCollect: #name)
		ifNotEmpty: [ :vars | definition at: #classInstVars put: vars asArray ].

	definition 		
		at: #category put: aClassDefinition category.
	
	^ self toSTON: definition