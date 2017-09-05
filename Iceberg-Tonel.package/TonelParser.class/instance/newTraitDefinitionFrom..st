private factory
newTraitDefinitionFrom: anArray
	| metadata |
	metadata := anArray sixth.
	^ { 
	MCTraitDefinition
		name: (metadata at: #name)
		traitComposition: (metadata at: 'traitcomposition' ifAbsent: [ '{}' ])
		category: (metadata at: #category)
		comment: anArray second
		commentStamp: (metadata at: #timestamp ifAbsent: [ '' ]).
	MCClassTraitDefinition
 		baseTraitName: (metadata at: #name)
 		classTraitComposition: (metadata at: #classTraits).
	}.