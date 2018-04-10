merging
mergeWith: anotherNode onLeft: leftBlock onRight: rightBlock onMerge: mergeBlock
	
	^ anotherNode collect: rightBlock