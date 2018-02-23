tests
"tests"
testCreateDirectoryWithFile

	| tree |
	tree := IceNode new.
	(tree ensureDirectoryNamed: 'src') ensureFileNamed: 'tmp'.
	
	self assert: (tree / 'src' / 'tmp') isFileNode