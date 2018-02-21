tests
testCreateTreeWithFile

	| tree |
	tree := IceRootNode new.
	tree ensureFileNamed: 'Readme.md'.
	
	self assert: (tree / 'Readme.md') isFileNode