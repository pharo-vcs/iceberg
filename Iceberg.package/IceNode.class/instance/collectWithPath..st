enumerating
collectWithPath: aBlock
	| newNode |
	newNode := self class value: (aBlock value: self value value: self path).
	self nodesDo: [ :e |
		newNode addNode: (e collectWithPath: aBlock) ].
	^ newNode