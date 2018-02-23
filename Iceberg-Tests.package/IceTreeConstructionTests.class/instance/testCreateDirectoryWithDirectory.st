tests
testCreateDirectoryWithDirectory

	| tree |
	tree := IceNode new.
	(tree ensureDirectoryNamed: 'src') ensureDirectoryNamed: 'tmp'.
	
	self assert: (tree / 'src' / 'tmp') isDirectoryNode