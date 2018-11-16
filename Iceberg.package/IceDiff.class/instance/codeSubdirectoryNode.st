accessing
codeSubdirectoryNode
	
	^ self repository subdirectory
		ifNotEmpty: [ tree firstNodeSuchThat: [ :definition | self isCodeSubdirectory: definition ] ]
		ifEmpty: [ tree ]
		