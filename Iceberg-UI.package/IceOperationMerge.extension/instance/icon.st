*Iceberg-UI
icon

	self isRightChosen ifTrue: [ 
		^ Smalltalk ui icons iconNamed: #forward ].
	self isLeftChosen ifTrue: [ 
		^ Smalltalk ui icons iconNamed: #changeBlock ].
	^ Smalltalk ui icons iconNamed: #changeUpdate