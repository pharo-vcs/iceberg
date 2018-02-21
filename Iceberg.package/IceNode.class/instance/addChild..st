adding
addChild: aChild
	
	self assert: (aChild isKindOf: IceNode) not.
	^ self addNode: (IceNode value: aChild parent: self).