accessing
writerClass
	
	^ writerClass ifNil: [ writerClass := self repository writerClass ]