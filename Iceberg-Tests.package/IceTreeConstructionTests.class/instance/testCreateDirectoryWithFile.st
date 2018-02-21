tests
testCreateDirectoryWithFile

	| tree |
	tree := IceRootNode new.
	(tree ensureDirectoryNamed: 'src') ensureFileNamed: 'tmp'.
	
	self assert: (tree / 'src' / 'tmp') isFileNode