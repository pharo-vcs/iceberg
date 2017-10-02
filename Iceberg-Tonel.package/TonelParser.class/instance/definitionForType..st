private factory
definitionForType: aString 
	aString = TonelWriter classLabel ifTrue: [ ^ MCClassDefinition ].
	aString = TonelWriter traitLabel ifTrue: [ ^ MCTraitDefinition ].	
	aString = TonelWriter extensionLabel ifTrue: [ ^ nil ].
	
	TonelParseError signal: 'Unknown type declaration.'