operations
simmetricDifference: aNode
	
	| mergedTree |
	mergedTree := self
		mergeWith: aNode
		onLeft: [ :definition | IceAddition definition: definition ]
		onRight: [ :definition | IceRemoval definition: definition ]
		onMerge: [ :left :right | (left = right)
			ifTrue: [ IceNoModification definition: left ]
			ifFalse: [ IceModification from: left to: right ] ].

	^ mergedTree select: [ :operation | operation hasChanges ]