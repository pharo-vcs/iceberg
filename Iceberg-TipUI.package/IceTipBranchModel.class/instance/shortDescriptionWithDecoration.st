accessing
shortDescriptionWithDecoration
	^ self addDecorationTo: (self entity isRemote 
		ifTrue: [ self name copyAfter: $/ ]
		ifFalse: [ self name])