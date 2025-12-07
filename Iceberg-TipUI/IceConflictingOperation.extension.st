Extension { #name : 'IceConflictingOperation' }

{ #category : '*Iceberg-TipUI' }
IceConflictingOperation >> operationIconName [

	^ #uncommentedClass
]

{ #category : '*Iceberg-TipUI' }
IceConflictingOperation >> preferredColor [
	
	^ self isResolved
		ifTrue: [ Color gray ]
		ifFalse: [ Color red ]
]
