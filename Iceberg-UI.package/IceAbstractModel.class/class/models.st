accessing
models
	"
	self models removeAll
	"
	^ ModelCache ifNil: [ ModelCache := WeakValueDictionary new ]