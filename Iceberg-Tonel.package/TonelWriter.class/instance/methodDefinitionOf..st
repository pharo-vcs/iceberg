private definitions
methodDefinitionOf: aMethodDefinition
	^ self toSTON: (OrderedDictionary new 
		at: #category put: aMethodDefinition category; 
		yourself)	
	