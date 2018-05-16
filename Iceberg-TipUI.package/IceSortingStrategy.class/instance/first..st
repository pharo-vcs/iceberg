accessing
first: anObject
	first := anObject.
	
	(anObject ~= #none and: [ self last = anObject ])
		ifTrue: [ self last: #none ]