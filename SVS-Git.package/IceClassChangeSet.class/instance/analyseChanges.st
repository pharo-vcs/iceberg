private
analyseChanges
	| newChanges |
	newChanges := self parent changes select: [ :operation | 
		operation targetClass = self targetClass ].
	
	newChanges
		detect: [ :operation | operation definition isClassDefinition ]
		ifFound: [ :classDef | 
			classDefinition := classDef. 
			changes := newChanges copyWithout: classDef.
		]
		ifNone: [ changes := newChanges ].

