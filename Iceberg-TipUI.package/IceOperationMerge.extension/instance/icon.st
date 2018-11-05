*Iceberg-TipUI
icon

	self isRightChosen ifTrue: [ ^ self iconNamed: #changeBlock ].
	self isLeftChosen ifTrue: [ ^ self iconNamed: #forward ].
	
	^ self operationIcon