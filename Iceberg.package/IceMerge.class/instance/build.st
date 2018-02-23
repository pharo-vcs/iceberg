building
build
	
	| commonAncestor sourceDiff targetDiff |
	commonAncestor := source commonAncestorWith: target.
	sourceDiff := IceDiff from: source to: commonAncestor.
	targetDiff := IceDiff from: target to: commonAncestor.
	
	mergeTree := sourceDiff tree mergedTree
		mergeWith: targetDiff tree mergedTree
		onLeft: [ :left | IceNonConflictingOperation operation: left ]
		onRight: [ :right | IceNonConflictingOperation operation: right ]
		onMerge: [ :left :right | left mergeWithOperation: right ]