private
ensureSourceCodeParentNodeIn: aNode
	| codeSubdirectoryPathString |
	codeSubdirectoryPathString := diff repository subdirectoryPath pathString.
	(codeSubdirectoryPathString isEmpty)
		ifTrue: [  ^ aNode ].
	
	aNode childAt: codeSubdirectoryPathString ifPresent: [ :node |
		self assert: node value isDirectoryDefinition.
		^ node ].
	^ aNode addChild: (IceDirectoryDefinition named: codeSubdirectoryPathString)