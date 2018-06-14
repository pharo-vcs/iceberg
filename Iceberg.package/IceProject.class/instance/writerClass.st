accessing
writerClass
	
	^ TIceRepositoryWriter users detect: [ :each | each id = self fileFormat id ]