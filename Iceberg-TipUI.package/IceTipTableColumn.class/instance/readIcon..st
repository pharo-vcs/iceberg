accessing
readIcon: anObject
	^ self icon 
		ifNotNil: [ self icon value: anObject ]