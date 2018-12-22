private
ensureDirectoryNamed: aName inNode: aNode

	aNode childAt: aName ifPresent: [ :node |
		self assert: node value isDirectoryDefinition.
		^ node ].
	^ aNode addChild: (IceDirectoryDefinition named: aName)