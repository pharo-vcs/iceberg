test-modifications
testMergeTwoModificationsToDifferentDefinitionsInverseIsConflict

	| rightTree leftTree mergedTree |
	leftTree := IceNode value: (IceNoModification definition: (IceTestDefinition named: 'left')).
	rightTree := IceNode value: (IceModification left: (IceTestDefinition named: 'right') right: (IceTestDefinition named: 'left')).
	
	mergedTree := IceMerge new merge: rightTree with: leftTree.
	self assert: mergedTree value isConflict not.
	self assert: mergedTree value rightContents equals: 'left'.
	self assert: mergedTree value leftContents equals: 'right'.