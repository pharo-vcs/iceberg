private
ensureSourceCodeDirectoryIn: aNode
	| codeSubdirectoryName |
	codeSubdirectoryName := diff repository subdirectory.
	(codeSubdirectoryName isEmpty or: [ codeSubdirectoryName = '.' ])
		ifTrue: [  ^ aNode ].
	
	aNode childAt: codeSubdirectoryName ifPresent: [ :node |
		self assert: node value isDirectoryDefinition.
		^ node ].
	^ aNode addChild: (IceDirectoryDefinition named: codeSubdirectoryName)