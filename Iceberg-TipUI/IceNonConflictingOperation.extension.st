Extension { #name : 'IceNonConflictingOperation' }

{ #category : '*Iceberg-TipUI' }
IceNonConflictingOperation >> operationIconName [
	
	^ operation iconName
]

{ #category : '*Iceberg-TipUI' }
IceNonConflictingOperation >> preferredColor [
	
	^ self isResolved
		ifTrue: [ Color gray ]
		ifFalse: [ nil ]
]
