*Iceberg-TipUI
icon

	self isRightChosen ifTrue: [ 
		^ Smalltalk ui icons iconNamed: #changeBlock ].
	self isLeftChosen ifTrue: [ 
		^ Smalltalk ui icons iconNamed: #forward ].
	^ self operationIcon