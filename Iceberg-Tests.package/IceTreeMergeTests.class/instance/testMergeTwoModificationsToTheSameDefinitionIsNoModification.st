test-modifications
testMergeTwoModificationsToTheSameDefinitionIsNoModification

	| rightTree leftTree mergedTree |
	leftTree := rightTree := IceNode value: (IceModification left: IceTestDefinition new right: nil).
	
	mergedTree := IceMerge new merge: leftTree into: rightTree.
	self assert: mergedTree isEmpty.