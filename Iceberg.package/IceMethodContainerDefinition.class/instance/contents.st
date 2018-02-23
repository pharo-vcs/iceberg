accessing
"accessing"
contents
	
	^ self isMeta
		ifFalse: [ mcDefinition definitionString ]
		ifTrue: [ mcDefinition classDefinitionString ]