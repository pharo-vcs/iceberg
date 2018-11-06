instance creation
id: aString action: aBlock width: aNumber
	^ self new
		id: aString;
		action: aBlock;
		width: aNumber;
		yourself