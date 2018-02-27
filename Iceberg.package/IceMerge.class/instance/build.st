building
build
	
	| commonAncestor sourceDiff targetDiff |
	commonAncestor := source commonAncestorWith: target.
	sourceDiff := IceDiff from: source to: commonAncestor.
	targetDiff := IceDiff from: target to: commonAncestor.
	
	mergeTree := self merge: sourceDiff tree
		with: targetDiff tree