accessing
codeSubdirectoryNode
	
	^ self repository subdirectory
		ifNotEmpty: [ tree detect: [ :definition | self isCodeSubdirectory: definition ] ]
		ifEmpty: [ tree ]
		