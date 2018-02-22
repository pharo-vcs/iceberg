testing
isMerged
	
	^ mergeTree allSatisfy: [ :operation |
		operation isConflict not or: [ operation isResolved ] ]