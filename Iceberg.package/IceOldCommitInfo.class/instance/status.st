as yet unclassified
status
	self isCurrent ifTrue: [ ^ 'Current' ].
	self isLoaded ifTrue: [ ^ 'Loaded' ].
	self isMerged ifTrue: [ ^ 'Not loaded' ].

	^ 'Not merged'