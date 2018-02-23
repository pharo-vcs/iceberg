test-additions
testMergeConflictingAdditions

	| rightTree leftTree mergedTree |
	leftTree := IceNode value: (IceAddition definition: (IceTestDefinition named: 'left1')).
	rightTree := IceNode value: (IceAddition definition: (IceTestDefinition named: 'left2')).
	
	mergedTree := IceMerge new merge: leftTree with: rightTree.
	self assert: mergedTree value isConflict.
	self assert: mergedTree value leftContents equals: 'left1'.
	self assert: mergedTree value rightContents equals: 'left2'.