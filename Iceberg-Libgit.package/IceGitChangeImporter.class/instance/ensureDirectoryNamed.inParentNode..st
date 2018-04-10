building
ensureDirectoryNamed: aString inParentNode: aNode
	
	aNode childAt: aString ifPresent: [ :node |
		self assert: node value isDirectoryDefinition.
		^ node ].
	^ aNode addChild: (IceDirectoryDefinition named: aString)