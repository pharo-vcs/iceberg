reflective operations
doesNotUnderstand: aMessage
	aMessage selector isUnary 
		ifTrue: [ 
			^ cache 
				at: aMessage selector 
				ifAbsentPut: [ self forwardMessage: aMessage ] ].
	^ self forwardMessage: aMessage