accessing
projectPath
	^ self owner
		ifNil: [ self projectName ]
		ifNotNil: [ :ownerName | ownerName , '/' , self projectName ]