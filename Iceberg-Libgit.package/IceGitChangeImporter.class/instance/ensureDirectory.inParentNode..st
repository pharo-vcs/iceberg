building
ensureDirectory: aFileReference inParentNode: aNode
	
	aNode childAt: aFileReference basename ifPresent: [ :node |
		self assert: node value isDirectoryDefinition.
		^ node ].
	^ aNode addChild: (IceDirectoryDefinition named: aFileReference basename)