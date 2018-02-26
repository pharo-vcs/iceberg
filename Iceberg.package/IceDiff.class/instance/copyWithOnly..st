copying
copyWithOnly: aCollection 
	
	| treeCopy |
	treeCopy := tree copyWithOnly: aCollection.
	
	^ self class new
		source: source;
		target: target;
		diffTree: treeCopy;
		sourceDirectory: sourceDirectory;
		yourself