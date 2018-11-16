enumerating
nextChildNodeStartingFrom: anIceNode suchThat: conditionBlock ifNone: noneBlock 
	
	| aCollection |
	aCollection := self children.
	(aCollection indexOf: anIceNode) + 1
		to: aCollection size do: [ :index | | item |
			item := aCollection at: index.
			(conditionBlock value: item)
				ifTrue: [ ^ item ].
			item
				nextNodeSuchThat: conditionBlock
				ifFound: [ :found | ^ found ] ].
	
	self parent ifNil: [^ noneBlock value ].
	
	^ self parent
		nextChildNodeStartingFrom: self
		suchThat: conditionBlock
		ifNone: noneBlock