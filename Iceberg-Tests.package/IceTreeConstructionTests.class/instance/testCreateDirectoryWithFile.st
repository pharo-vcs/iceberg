tests
testCreateDirectoryWithFile

	| tree child |
	tree := IceNode new.
	child := tree addChild: (IceDirectoryDefinition named: 'src').
	child  addChild: (IceFileDefinition named: 'tmp').
	
	self assert: (tree / 'src' / 'tmp') value isFileDefinition