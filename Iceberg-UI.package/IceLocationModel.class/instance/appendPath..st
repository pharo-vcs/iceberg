accessing
appendPath: aString
	keptLocation ifNil: [ keptLocation := self location ].
	
	self basicLocation: (aString 
		ifNotEmpty: [ (keptLocation ifNil: [ '.' asFileReference ]) / aString ]
		ifEmpty: [ keptLocation ]).