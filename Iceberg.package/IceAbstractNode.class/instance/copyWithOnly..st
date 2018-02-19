copy
copyWithOnly: aCollection 
	
	| emptyCopy |
	emptyCopy := self basicCopy.
	self changes do: [ :each |
		(aCollection includes: each)
			ifTrue: [ emptyCopy addChange: (each copyWithOnly: aCollection) ] ].
	^ emptyCopy