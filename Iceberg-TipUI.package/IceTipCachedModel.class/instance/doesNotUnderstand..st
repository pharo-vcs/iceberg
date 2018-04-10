reflective operations
doesNotUnderstand: aMessage
	aMessage selector isUnary
		ifTrue: [ 
			cache 
				at: aMessage selector
				ifPresent: [ :value | ^ value ].
			 (self realObject class lookupSelector: aMessage selector)
				ifNotNil: [ :method |
					(method hasPragmaNamed: #noCache)
						ifFalse: [ 
							^ cache
								at: aMessage selector 
								put: (self forwardMessage: aMessage) ] ] ].
	^ self forwardMessage: aMessage