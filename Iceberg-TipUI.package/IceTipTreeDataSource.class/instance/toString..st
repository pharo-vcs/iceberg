accessing
toString: anObject
	^ self format 
		ifNotNil: [ self format value: anObject ]
		ifNil: [ anObject ]