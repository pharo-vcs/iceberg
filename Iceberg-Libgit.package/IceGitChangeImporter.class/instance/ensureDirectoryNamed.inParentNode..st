building
ensureDirectoryNamed: aString inParentNode: aNode
	
	^ aNode addChild: (IceDirectoryDefinition named: aString)