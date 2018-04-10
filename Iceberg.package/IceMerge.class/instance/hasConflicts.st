testing
hasConflicts
	
	^ mergeTree anySatisfy: [ :e | e isConflict ]