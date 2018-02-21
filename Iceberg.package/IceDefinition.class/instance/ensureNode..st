building
ensureNode: nodeToAdd

	childrenDictionary at: nodeToAdd name ifPresent: [ :child |
		(child = nodeToAdd) ifTrue: [ ^ child ].
		
		"This means a structural conflict"
		child replaceBy: (IceConflictNode left: child right: nodeToAdd).
		^ nodeToAdd ].
		
	^ self addChild: nodeToAdd