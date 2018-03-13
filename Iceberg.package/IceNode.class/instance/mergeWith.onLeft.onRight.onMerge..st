enumerating
mergeWith: anotherTree onLeft: leftBlock onRight: rightBlock onMerge: mergeBlock
	
	| mergedTree newNode |
	mergedTree := mergeBlock value: self value value: anotherTree value.
	newNode := self class value: mergedTree.
		
	self keysDo: [ :key |
		(anotherTree includesKey: key)
			ifTrue:  [ | childNode | 
				childNode := (self / key)
					mergeWith: anotherTree / key
					onLeft: leftBlock
					onRight: rightBlock
					onMerge: mergeBlock.
				childNode addTo: newNode ]
			ifFalse: [ 
				newNode addNode: ((self / key) collect: leftBlock) ] ].

	anotherTree keysDo: [ :key |
		(self includesKey: key)
			ifFalse: [ 
				newNode addNode: ((anotherTree / key) collect: rightBlock) ] ].

	^ newNode