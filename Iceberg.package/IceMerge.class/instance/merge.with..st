building
merge: aTreeOfOperations with: anotherTreeOfOperations
	
	^ aTreeOfOperations
		mergeWith: anotherTreeOfOperations
		onLeft: [ :left | IceNonConflictingOperation operation: left ]
		onRight: [ :right | IceNonConflictingOperation operation: right ]
		onMerge: [ :left :right | left mergeWithOperation: right ]