private factory
definitionForType: aString 
	aString = ShoalWriter classLabel ifTrue: [ ^ MCClassDefinition ].
	aString = ShoalWriter traitLabel ifTrue: [ ^ MCTraitDefinition ].	
	aString = ShoalWriter extensionLabel ifTrue: [ ^ nil ].
	
	ShoalParseError signal: 'Unknown type declaration.'