testing
contents
	"Answer the contents of the change from the model."

	^ item children collect: [ :each | IceMergeListWrapper with: each model: model ]