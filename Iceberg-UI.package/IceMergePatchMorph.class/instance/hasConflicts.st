testing
hasConflicts
	"Answer whether there are any conflicts."
	
	^ self model mergeTree anySatisfy: [:conflict |
		conflict isConflict ]