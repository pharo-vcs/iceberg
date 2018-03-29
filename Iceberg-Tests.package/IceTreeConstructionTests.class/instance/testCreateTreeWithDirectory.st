tests
testCreateTreeWithDirectory

	| tree |
	tree := IceNode new.
	tree addChild: (IceDirectoryDefinition named: 'src').
	
	self assert: (tree / 'src') value isDirectoryDefinition