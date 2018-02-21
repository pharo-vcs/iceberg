testing
isExtension: aString 
	
	snapshot definitionForMethodContainerNamed: aString ifAbsent: [ ^ true ].
	^ false