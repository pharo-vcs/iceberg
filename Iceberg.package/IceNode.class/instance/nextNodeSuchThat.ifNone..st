enumerating
nextNodeSuchThat: conditionBlock ifNone: noneBlock
	
	self children do: [ :each |
		(conditionBlock value: each)
			ifTrue: [ ^ each ].
		each
			nextNodeSuchThat: conditionBlock
			ifFound: [ :found | ^ found  ] ].
	
	^ self parent
		nextChildNodeStartingFrom: self
		suchThat: conditionBlock
		ifNone: noneBlock