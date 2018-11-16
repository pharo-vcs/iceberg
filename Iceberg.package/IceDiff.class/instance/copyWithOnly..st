copying
copyWithOnly: aCollection 
	
	| treeCopy selectedOperations |
	selectedOperations := aCollection collect: #value.
	treeCopy := tree select: [ :node | selectedOperations includes: node ].
	
	^ self class new
		sourceVersion: source;
		targetVersion: target;
		diffTree: treeCopy;
		yourself