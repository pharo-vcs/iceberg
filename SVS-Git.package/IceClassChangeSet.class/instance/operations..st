accessing
operations: aCollection
	aCollection 
		detect: [ :operation | operation definition isClassDefinition ]
		ifFound: [ :classDef | 
			classDefinition := classDef. 
			operations := aCollection copyWithout: classDef.
		]
		ifNone: [ operations := aCollection ].
	
