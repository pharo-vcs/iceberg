accessing
changes
	"Answer the changes tree roots."
	
	^ model ifNotNil: [ model mergeTree children collect: [ :each | IceMergeListWrapper with: each model: model ] ]