importing
addFileNamed: aString path: aRelativePath contents: aByteArray 

	| fileParentNode |

	fileParentNode := parentNode.
	aRelativePath segments allButLastDo: [ :each | 
		fileParentNode := (fileParentNode includesKey: each)
			ifTrue: [ fileParentNode / each ]
			ifFalse: [ fileParentNode addChild: (IceDirectoryDefinition named: each) ].
		self assert: fileParentNode value isDirectoryDefinition ].

	fileParentNode addChild: (IceFileDefinition
		named: aString
		path: aRelativePath
		contents: aByteArray).