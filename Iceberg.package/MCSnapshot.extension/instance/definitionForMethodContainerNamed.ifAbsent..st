*Iceberg-Changes
definitionForMethodContainerNamed: aString ifAbsent: aBlock
	
	^ definitions detect: [ :e | e isClassDefinition and: [ e className = aString ] ] ifNone: aBlock