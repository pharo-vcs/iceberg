enumerating
collect: aBlock
	| newNode |
	newNode := self class value: (aBlock value: self value).
	self nodesDo: [ :e |
		newNode addNode: (e collect: aBlock) ].
	^ newNode