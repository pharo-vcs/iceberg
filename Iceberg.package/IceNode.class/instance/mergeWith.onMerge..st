enumerating
mergeWith: anotherTree onMerge: mergeBlock
	
	^ self
		mergeWith: anotherTree
		onLeft: [ :each | each ]
		onRight:  [ :each | each ]
		onMerge: mergeBlock