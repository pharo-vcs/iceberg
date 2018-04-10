testing
useAllIncomingVersion
	"Mark all conflicts as remote."
	
	self model mergeTree do: [:c | 
		c isConflict ifTrue: [ c selectRight ] ].
	self changed: #changes.
	self updateSource