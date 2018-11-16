tests
testCreateTreeWithFile

	| tree |
	tree := IceNode new.
	tree addChild: (IceFileDefinition named: 'Readme.md').
	
	self assert: (tree / 'Readme.md') value isFileDefinition