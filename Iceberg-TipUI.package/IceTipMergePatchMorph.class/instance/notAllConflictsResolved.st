testing
notAllConflictsResolved
	"Answer whether any conflicts are unresolved."
	
	^self model mergeTree anySatisfy: [:item | 
		item isConflict and: [item isResolved not]]