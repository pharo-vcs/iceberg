*Iceberg-UI
icon

	^ self operation
		ifNil: [ Smalltalk ui icons iconNamed: #trait ]
		ifNotNil: [ super icon ]