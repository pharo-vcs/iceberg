tests
testEmptyTreeIsRootNode

	| tree |
	tree := IceNode new.
	
	self assert: tree isRootDefinition