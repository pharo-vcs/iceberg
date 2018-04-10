accessing
descriptionWithDecoration
	^ self addDecorationTo: (self entity isRemote 
		ifTrue: [ self entity shortName ]
		ifFalse: [ self name ])