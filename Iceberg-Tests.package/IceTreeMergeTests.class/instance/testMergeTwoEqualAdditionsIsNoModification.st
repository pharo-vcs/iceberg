test-removals
testMergeTwoEqualAdditionsIsNoModification

	| rightTree leftTree mergedTree |
	leftTree := rightTree := self buildTestTreeWithOperation: (IceAddition definition: IceTestDefinition new).
	
	mergedTree := IceMerge new merge: leftTree into: rightTree.
	self assert: mergedTree isEmpty.