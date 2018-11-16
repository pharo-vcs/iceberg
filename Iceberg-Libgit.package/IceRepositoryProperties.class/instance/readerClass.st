accessing
readerClass
	^ TIceRepositoryReader users detect: [ :each | each id = self fileFormat id  ]