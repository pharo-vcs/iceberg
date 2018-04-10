testing
hasChanges
	
	^ value hasChanges or: [ self children anySatisfy: [ :child | child hasChanges ] ]