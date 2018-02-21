accessing
replace: oldNode with: newNode
	
	self assert: oldNode name = newNode name.
	childrenDictionary at: oldNode name put: newNode