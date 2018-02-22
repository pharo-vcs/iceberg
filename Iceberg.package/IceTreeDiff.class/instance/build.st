building
build

	mergedTree := sourceTree
		mergeWith: targetTree
		onLeft: [ :definition | IceAddition definition: definition ]
		onRight: [ :definition | IceRemoval definition: definition ]
		onMerge: [ :left :right | (left = right)
			ifTrue: [ IceNoModification definition: left ]
			ifFalse: [ IceModification left: left right: right ] ].

	mergedTree := mergedTree select: [ :operation | operation hasChanges ]