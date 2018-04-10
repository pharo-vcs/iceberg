actions
nextConflict
	"Answer the next (unresolved) conflict or, nil if none."

	| node firstNode |
	firstNode := self selectedChangeWrapper
		ifNil: [ IceMergeListWrapper with: model mergeTree children first model: model ].
	
	node := firstNode item
		nextNodeSuchThat: [ :item | item value isConflict and: [item value isResolved not] ]
		ifNone: [ ^ nil ].
		
	^ IceMergeListWrapper with: node model: model.