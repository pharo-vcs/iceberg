actions
createRepository	
	^ [
		self validate.
		self isCloning
			ifTrue: [ self cloneRepository ]
			ifFalse: [ self addLocalRepository ] ]
	on: IceDuplicatedRepository 
	do: [ :e | 
		"This is a HACK to allow process to recover from here"
		e signal ]