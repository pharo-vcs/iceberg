enumerating
nextNodeSuchThat: conditionBlock ifFound: foundBlock 
	
	self children do: [ :each |
		(conditionBlock value: each)
			ifTrue: [ ^ foundBlock value: each ].
		each
			nextNodeSuchThat: conditionBlock
			ifFound: [ :found | ^  foundBlock value: found  ] ].