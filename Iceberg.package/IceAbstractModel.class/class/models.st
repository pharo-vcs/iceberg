accessing
models
	"self models removeAll"
	^ ModelCache ifNil: [ ModelCache := IdentityDictionary new ]