accessing
fileFormat
	
	^ TIceRepositoryWriter users
		detect: [ :each | each id = (self repositoryProperties properties at: #format ifAbsent: [ ^ self defaultFileFormat ])  ]
		ifNone: [ self defaultFileFormat ]