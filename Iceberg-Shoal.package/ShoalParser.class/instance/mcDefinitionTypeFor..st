private factory
mcDefinitionTypeFor: aString 
	aString = self class classLabel ifTrue: [ ^ MCClassDefinition ].
	aString = self class traitLabel ifTrue: [ ^ MCTraitDefinition ].	
	aString = self class extensionLabel ifTrue: [ ^ nil ].
	
	ShoalParseError signal: 'Unknown type declaration.'