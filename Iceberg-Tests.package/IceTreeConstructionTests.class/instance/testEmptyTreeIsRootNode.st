tests
testEmptyTreeIsRootNode

	| tree |
	tree := IceRootNode new.
	
	self assert: tree isRootDefinition