copying
copyWithOnly: aCollection 
	
	| selectedOperations treeCopy |
	selectedOperations := aCollection collect: #value.
	treeCopy := mergedTree select: [ :node | selectedOperations includes: node ].
	
	^ self class new
		source: sourceTree;
		target: targetTree;
		mergedTree: treeCopy;
		yourself