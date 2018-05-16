testing
keepAllCurrentVersion
	"Mark all conflicts as local."
	
	self model mergeTree do: [:c | 
		c isConflict ifTrue: [ c selectLeft ] ].
	self changed: #changes.
	self updateSource