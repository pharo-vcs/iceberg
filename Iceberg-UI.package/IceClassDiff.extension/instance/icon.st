*Iceberg-UI
icon

	^ self operation
		ifNil: [ Smalltalk ui icons iconNamed: #class ]
		ifNotNil: [ super icon ]