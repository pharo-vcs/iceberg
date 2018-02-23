tests
"tests"
testCreateTreeWithFile

	| tree |
	tree := IceNode new.
	tree ensureFileNamed: 'Readme.md'.
	
	self assert: (tree / 'Readme.md') isFileNode