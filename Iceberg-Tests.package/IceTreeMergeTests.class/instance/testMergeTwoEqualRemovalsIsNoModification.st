test-removals
testMergeTwoEqualRemovalsIsNoModification

	| rightTree leftTree mergedTree |
	leftTree := rightTree := IceNode value: (IceRemoval definition: IceTestDefinition new).
	
	mergedTree := IceMerge new merge: leftTree into: rightTree.
	self assert: mergedTree isEmpty.