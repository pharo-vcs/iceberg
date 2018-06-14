accessing
fileFormat
	
	^ TIceRepositoryWriter users
		detect: [ :each | each id = (self repository properties properties at: #format)  ]
		ifNone: [ IceLibgitRepository defaultFileFormat ]