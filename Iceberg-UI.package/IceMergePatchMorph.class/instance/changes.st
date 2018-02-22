accessing
changes
	"Answer the changes tree roots."
	
	^ model ifNotNil: [ (IceDiffNode on: model mergeTree) children ]