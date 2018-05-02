accessing
resolve: aRelativePath ifPresent: presentBlock ifAbsent: absentBlock 	
	| segments node |
	segments := aRelativePath segments.
	
	segments ifEmpty: [ ^ presentBlock value: self value ].
	
	node := childrenDictionary at: segments first ifAbsent: [^ absentBlock value ].
	
	^node
		resolve: (RelativePath withAll: segments allButFirst) 
		ifPresent: presentBlock
		ifAbsent: absentBlock