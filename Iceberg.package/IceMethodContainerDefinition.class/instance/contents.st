accessing
contents
	
	mcDefinition ifNil: [ ^ '' ].
	^ self isMeta
		ifFalse: [ mcDefinition definitionString ]
		ifTrue: [ mcDefinition classDefinitionString ]