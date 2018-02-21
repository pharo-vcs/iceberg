accessing
resolve: aRelativePath ifAbsent: aBlock
	
	| segments node |
	segments := aRelativePath segments.
	node := childrenDictionary at: segments first ifAbsent: aBlock.
	^ segments size = 1
		ifTrue: [ node ]
		ifFalse: [ node resolve: (RelativePath withAll: aRelativePath segments allButFirst) ifAbsent: aBlock ]