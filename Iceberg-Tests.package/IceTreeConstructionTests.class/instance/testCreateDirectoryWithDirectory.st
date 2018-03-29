tests
testCreateDirectoryWithDirectory

	| tree child |
	tree := IceNode new.
	child := tree addChild: (IceDirectoryDefinition named: 'src').
	child  addChild: (IceDirectoryDefinition named: 'tmp').
	
	self assert: (tree / 'src' / 'tmp') value isDirectoryDefinition