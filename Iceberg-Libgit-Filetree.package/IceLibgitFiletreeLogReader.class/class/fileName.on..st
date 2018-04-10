instance creation
fileName: aString on: aCommit
	^ (self on: aCommit)
		fileName: aString;
		yourself