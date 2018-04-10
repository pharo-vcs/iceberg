test-removals
testConflictingNoModificationWithRemoval

	| rightTree leftTree mergedTree |
	leftTree := IceNode value: (IceRemoval definition: (IceTestDefinition named: 'common')).
	rightTree := IceNode value: (IceNoModification definition: (IceTestDefinition named: 'common')).
	
	mergedTree := IceMerge new merge: rightTree with: leftTree.
	self assert: mergedTree value isConflict.
	self assert: mergedTree value leftContents equals: 'common'.
	self assert: mergedTree value rightContents equals: ''.