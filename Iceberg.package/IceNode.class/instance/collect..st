enumerating
collect: aBlock
	
	parent := self class value: (aBlock value: self value).
	self nodesDo: [ :e |
		parent addNode: (e collect: aBlock) ].
	^ parent