enumerating
firstNodeSuchThat: conditionBlock ifNone: noneBlock
	
	(conditionBlock value: self)
		ifTrue: [ ^ self ].
	
	self
		nextNodeSuchThat: conditionBlock
		ifFound: [ :found | ^ found ].
	
	^ self parent
		ifNil: noneBlock
		ifNotNil: [
			self parent
				nextChildNodeStartingFrom: self
				suchThat: conditionBlock
				ifNone: noneBlock ]