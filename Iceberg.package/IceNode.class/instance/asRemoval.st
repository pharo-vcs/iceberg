operations
asRemoval

	parent := IceNode
		value: (IceRemoval definition: self value).
	self nodesDo: [ :e |
		parent addNode: e asRemoval ].
	^ parent