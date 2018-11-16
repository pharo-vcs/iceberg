testing
hasAnyNonIncomingConflicts
	"Answer whether there are any conflicts not marked as incoming."

	^ self model mergeTree anySatisfy: [:conflict |
		conflict isConflict and: [ 
			conflict isResolved not or: [conflict isLeftChosen ] ] ]