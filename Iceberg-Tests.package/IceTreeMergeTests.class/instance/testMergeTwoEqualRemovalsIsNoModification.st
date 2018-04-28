test-removals
testMergeTwoEqualRemovalsIsNoModification

	| rightTree leftTree mergedTree operation |
	leftTree := rightTree := self buildTestTreeWithOperation: (IceRemoval definition: (IceTestDefinition named: 'old') ).
	
	mergedTree := IceMerge new merge: leftTree into: rightTree.
	operation := (mergedTree / 'old') value.
	
	self assert: (mergedTree / 'old') isEmpty.
	self deny: operation isConflict.
	self deny: operation chosenOperation isModification.