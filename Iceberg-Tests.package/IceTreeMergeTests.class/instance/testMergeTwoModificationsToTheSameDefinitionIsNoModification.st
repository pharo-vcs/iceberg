test-modifications
testMergeTwoModificationsToTheSameDefinitionIsNoModification

	| rightTree leftTree mergedTree |
	leftTree := rightTree := IceNode value: (IceModification left: IceTestDefinition new right: nil).
	
	mergedTree := IceMerge new merge: leftTree with: rightTree.
	self assert: mergedTree isEmpty.