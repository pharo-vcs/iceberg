testing
hasConflicts
	
	self calculateChanges.
	^ mergeTree anySatisfy: [ :e | e isConflict ]