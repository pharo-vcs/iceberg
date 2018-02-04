actions
createRepository	
	self validate.
	^ self isCloning 
		ifTrue: [ self cloneRepository ]
		ifFalse: [ self addLocalRepository ]