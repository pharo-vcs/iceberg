testing
hasAnyNonKeptConflicts
	"Answer whether there are any conflicts not marked as keep."

	^ self model mergeTree anySatisfy: [:conflict |
		conflict isConflict and: [ 
			conflict isResolved not or: [conflict isRightChosen ] ] ]