accessing
key
	
	^ super key , (self isMeta ifTrue: [ ' class' ] ifFalse: [ '' ])