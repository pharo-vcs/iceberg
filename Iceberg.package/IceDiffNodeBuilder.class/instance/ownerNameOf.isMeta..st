building
ownerNameOf: aString isMeta: aBoolean
	
	^ aString, (aBoolean ifTrue: [' class'] ifFalse: [''])