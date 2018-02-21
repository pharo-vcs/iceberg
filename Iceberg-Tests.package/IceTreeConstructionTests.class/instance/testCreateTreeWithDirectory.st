tests
testCreateTreeWithDirectory

	| tree |
	tree := IceRootNode new.
	tree ensureDirectoryNamed: 'src'.
	
	self assert: (tree / 'src') isDirectoryNode