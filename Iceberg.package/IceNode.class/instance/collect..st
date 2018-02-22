operations
"operations"
collect: aBlock
	
	parent := IceNode value: (aBlock value: self value).
	self nodesDo: [ :e |
		parent addNode: (e collect: aBlock) ].
	^ parent