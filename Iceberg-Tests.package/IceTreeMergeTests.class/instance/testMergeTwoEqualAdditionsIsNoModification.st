test-removals
testMergeTwoEqualAdditionsIsNoModification

	| rightTree leftTree mergedTree |
	leftTree := rightTree := IceNode value: (IceAddition definition: IceTestDefinition new).
	
	mergedTree := IceMerge new merge: leftTree with: rightTree.
	self assert: mergedTree isEmpty.