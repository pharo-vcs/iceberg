accessing
initialize

	super initialize.
	self childrenBlock: [ :directory | 
		directory isDirectory
			ifTrue: [ self childrenToShowFrom: directory ]
			ifFalse: [ #() ]].
		