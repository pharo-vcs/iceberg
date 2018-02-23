tests
testCreateTreeWithDirectory

	| tree |
	tree := IceNode new.
	tree ensureDirectoryNamed: 'src'.
	
	self assert: (tree / 'src') isDirectoryNode