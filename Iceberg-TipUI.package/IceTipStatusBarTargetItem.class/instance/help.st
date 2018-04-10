accessing
help
	"help here will be a selector, here"
	^ super help ifNotNil: [ :sel | self target perform: sel ]