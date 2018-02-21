tests
testCreateDirectoryWithDirectory

	| tree |
	tree := IceRootNode new.
	(tree ensureDirectoryNamed: 'src') ensureDirectoryNamed: 'tmp'.
	
	self assert: (tree / 'src' / 'tmp') isDirectoryNode