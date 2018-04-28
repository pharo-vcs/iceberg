test-removals
testMergeTwoEqualAdditionsIsNoModification

	| rightTree leftTree mergedTree operation |
	leftTree := rightTree := self buildTestTreeWithOperation: (IceAddition definition: (IceTestDefinition named: 'new')).
	
	mergedTree := IceMerge new merge: leftTree into: rightTree.
	operation := (mergedTree / 'new') value.
	
	self assert: (mergedTree / 'new') isEmpty.
	self deny: operation isConflict.
	self deny: operation chosenOperation isModification.