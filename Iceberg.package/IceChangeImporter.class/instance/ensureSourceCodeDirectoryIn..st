private
ensureSourceCodeDirectoryIn: aNode
	| codeSubdirectoryName |
	
	codeSubdirectoryName := diff repository subdirectory.
	codeSubdirectoryName ifEmpty: [  ^ aNode ].
	
	aNode childAt: codeSubdirectoryName ifPresent: [ :node |
		self assert: node value isDirectoryDefinition.
		^ node ].
	^ aNode addChild: (IceDirectoryDefinition named: codeSubdirectoryName)