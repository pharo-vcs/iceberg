accessing
contents
	mcDefinition ifNil: [ ^ '' ].
	^ self isMeta
		ifFalse: [ mcDefinition fullDefinitionString ]
		ifTrue: [ mcDefinition classDefinitionString ]