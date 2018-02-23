test-removals
testConflictingRemovalWithNoModification

	| rightTree leftTree mergedTree |
	leftTree := IceNode value: (IceRemoval definition: (IceTestDefinition named: 'common')).
	rightTree := IceNode value: (IceNoModification definition: (IceTestDefinition named: 'common')).
	
	mergedTree := IceMerge new merge: leftTree with: rightTree.
	self assert: mergedTree value isConflict.
	self assert: mergedTree value leftContents equals: ''.
	self assert: mergedTree value rightContents equals: 'common'.