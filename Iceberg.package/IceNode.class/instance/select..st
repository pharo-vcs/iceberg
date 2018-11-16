enumerating
select: aBlock

	| selectedChildren newNode |
	selectedChildren := self children collect: [ :childNode | 
		childNode select: aBlock ].
	
	((selectedChildren anySatisfy: [ :each | each isEmptyNode not ])
		or: [ aBlock value: self value ])
			ifFalse: [ ^ IceEmptyNode new ].
		
	newNode := self class value: self value.
	selectedChildren do: [ :e |
		e addTo: newNode ].
	^ newNode