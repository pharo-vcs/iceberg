reflective operations
doesNotUnderstand: aMessage
	aMessage selector isUnary 
		ifTrue: [ 
			^ self 
				cacheAt: aMessage selector 
				ifAbsentPut: [ self forwardMessage: aMessage ] ].
	^ self forwardMessage: aMessage