comparing
= another
	^ self species = another species and: [ self isSameUrl: another ]
	