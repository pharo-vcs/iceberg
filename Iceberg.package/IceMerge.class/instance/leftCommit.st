accessing
leftCommit

	^ self isInverseMerge
		ifTrue: [ self headCommit ]
		ifFalse: [ self imageCommit ].
