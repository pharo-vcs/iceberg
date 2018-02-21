operations
asAddition
	
	parent := IceNode
		value: (IceAddition definition: self value).
	self nodesDo: [ :e |
		parent addNode: e asAddition ].
	^ parent