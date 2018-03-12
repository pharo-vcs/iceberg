copying
copyWithOnly: aCollection 
	
	| treeCopy selectedOperations |
	selectedOperations := aCollection collect: #value.
	treeCopy := tree select: [ :node | selectedOperations includes: node ].
	
	^ self class new
		source: source;
		target: target;
		diffTree: treeCopy;
		yourself