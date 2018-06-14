accessing
fileFormat
	
	^ TIceRepositoryWriter users
		detect: [ :each | each id = (self repository properties properties at: #format ifAbsent: [ ^ self defaultFileFormat ])  ]
		ifNone: [ self defaultFileFormat ]