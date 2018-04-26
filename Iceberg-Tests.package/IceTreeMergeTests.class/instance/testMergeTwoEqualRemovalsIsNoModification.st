test-removals
testMergeTwoEqualRemovalsIsNoModification

	| rightTree leftTree mergedTree |
	leftTree := rightTree := self buildTestTreeWithOperation: (IceRemoval definition: IceTestDefinition new).
	
	mergedTree := IceMerge new merge: leftTree into: rightTree.
	self assert: mergedTree isEmpty.