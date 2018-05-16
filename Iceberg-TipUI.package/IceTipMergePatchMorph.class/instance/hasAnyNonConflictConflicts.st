testing
hasAnyNonConflictConflicts
	"Answer whether there are any conflicts not marked as a conflict."

	^ self model mergeTree anySatisfy: [:conflict |
		conflict isConflict and: [ conflict isResolved ] ]