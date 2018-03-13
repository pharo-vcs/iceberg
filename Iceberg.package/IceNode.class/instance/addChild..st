adding
addChild: aChild
	
	^ self addNode: (self class value: aChild parent: self).