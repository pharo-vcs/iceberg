accessing
conflictCount
	"Answer the number of conflicts that are unresolved."

	^(self model ifNil: [^0]) unresolvedConflictCount