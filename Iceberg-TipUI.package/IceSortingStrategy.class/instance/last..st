accessing
last: anObject
	last := anObject.
	
	(anObject ~= #none and: [ self first = anObject ])
		ifTrue: [ self first: #none ]