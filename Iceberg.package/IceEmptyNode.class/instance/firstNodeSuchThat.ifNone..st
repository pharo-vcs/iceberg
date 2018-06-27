enumerating
firstNodeSuchThat: conditionBlock ifNone: noneBlock
	
	(conditionBlock value: self)
		ifTrue: [ ^ self ].
	
	^ noneBlock value