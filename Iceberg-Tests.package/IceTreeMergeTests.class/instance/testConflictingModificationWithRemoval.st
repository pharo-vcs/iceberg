test-removals
testConflictingModificationWithRemoval

	| rightTree leftTree mergedTree |
	leftTree := IceNode value: (IceRemoval definition: (IceTestDefinition named: 'common')).
	rightTree := IceNode value: (IceModification left: (IceTestDefinition named: 'new') right: (IceTestDefinition named: 'common')).
	
	mergedTree := IceMerge new merge: rightTree with: leftTree.
	self assert: mergedTree value isConflict.
	self assert: mergedTree value leftContents equals: 'new'.
	self assert: mergedTree value rightContents equals: ''.