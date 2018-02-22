*Iceberg-UI
preferredColor
	
	^ self isResolved
		ifTrue: [ Color gray ]
		ifFalse: [ Color red ]