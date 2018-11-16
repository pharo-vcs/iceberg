printing
printOn: aStream
	super printOn: aStream.

	self parameters ifNotEmpty: [
		aStream nextPut: $(.
		aStream nextPutAll: (', ' join: (self parameters collect: #shortName)).
		aStream nextPut: $)
	]
