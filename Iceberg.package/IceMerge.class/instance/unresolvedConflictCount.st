accessing
unresolvedConflictCount

	^ mergeTree count: [ :operation |
		operation isConflict and: [ operation isResolved not ] ]