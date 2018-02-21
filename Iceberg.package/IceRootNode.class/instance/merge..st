operations
merge: anotherRootNode

	| newRootNode |
	newRootNode := IceRootNode new.
	self mergeInto: newRootNode.
	anotherRootNode mergeInto: newRootNode.
	^ newRootNode