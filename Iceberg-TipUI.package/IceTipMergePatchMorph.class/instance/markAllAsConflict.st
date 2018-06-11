testing
markAllAsConflict
	"Mark all conflicts as unresolved."
	
	self model mergeTree do: [:c | 
		c isConflict ifTrue: [ c clearSelection ] ].
	self changed: #changes.
	self updateSource