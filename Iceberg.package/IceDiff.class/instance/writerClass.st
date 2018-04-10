converting
writerClass
	
	"I am cached per instance of diff because obtaining the writer class is an expensive operation (600ms per call)"
	^ writerClass ifNil: [ writerClass := self repository writerClass ]