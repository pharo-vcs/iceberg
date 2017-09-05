private testing
matches: aStream anyOf: aCollection 
	^ aCollection anySatisfy: [ :each | each beginsWith: aStream contents ]