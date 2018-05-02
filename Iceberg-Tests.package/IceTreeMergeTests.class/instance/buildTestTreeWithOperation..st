test-removals
buildTestTreeWithOperation: anOperation

	^ (IceNode value: (IceNoModification definition: IceRootDefinition new))
		addChild: anOperation;
		yourself