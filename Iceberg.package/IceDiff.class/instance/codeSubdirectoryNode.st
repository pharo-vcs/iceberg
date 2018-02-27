accessing
codeSubdirectoryNode
	
	^ self repository subdirectory
		ifEmpty: [ tree ]
		ifNotEmpty: [ tree detect: [ :definition | self isCodeSubdirectory: definition ] ]