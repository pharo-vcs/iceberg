test-modifications
testMergeTwoModificationsToTheSameDefinitionIsNoModification

	| rightTree leftTree mergedTree operation |
	leftTree := rightTree := self buildTestTreeWithOperation: (IceModification left: (IceTestDefinition named: 'm1' contents: 'old') right: (IceTestDefinition named: 'm1' contents: 'new')).
	
	mergedTree := IceMerge new merge: leftTree into: rightTree.
	operation := (mergedTree / 'm1') value.
	
	self assert: (mergedTree / 'm1') isEmpty.
	self deny: operation isConflict.
	self assert: operation chosenOperation isModification.