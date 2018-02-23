tests
testEmptyTreeIsRootNode

	| tree |
	tree := IceNode value: IceRootDefinition new.
	
	self assert: tree value isRootDefinition