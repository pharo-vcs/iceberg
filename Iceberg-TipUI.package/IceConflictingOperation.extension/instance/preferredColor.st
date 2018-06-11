*Iceberg-TipUI
preferredColor
	
	^ self isResolved
		ifTrue: [ Color gray ]
		ifFalse: [ Color red ]