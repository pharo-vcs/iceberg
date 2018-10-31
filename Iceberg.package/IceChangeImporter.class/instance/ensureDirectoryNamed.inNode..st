private
ensureDirectoryNamed: aName inNode: aNode

	| newNode |
	aNode childAt: aName ifPresent: [ :node |
		self assert: node value isDirectoryDefinition.
		^ node ].
	^ aNode addChild: (IceDirectoryDefinition named: aName)