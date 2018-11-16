testing
isTrait: aString 
	
	| definition |
	definition := snapshot definitionForMethodContainerNamed: aString ifAbsent: [ ^ false ].
	^ definition isTraitDefinition