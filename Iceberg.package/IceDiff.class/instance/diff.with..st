operations
diff: leftTree with: rightTree
	
	| mergedTree |
	mergedTree := leftTree
		mergeWith: rightTree
		onLeft: [ :definition | IceAddition definition: definition ]
		onRight: [ :definition | IceRemoval definition: definition ]
		onMerge: [ :left :right | (left = right)
			ifTrue: [ IceNoModification definition: left ]
			ifFalse: [ IceModification left: left right: right ] ].

	^ mergedTree select: [ :operation | operation hasChanges ]