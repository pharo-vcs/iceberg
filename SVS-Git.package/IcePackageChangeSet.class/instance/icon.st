*SVS-Git-UI
icon
	^ self elements 
		ifEmpty: [ Smalltalk ui icons iconNamed: #emptyPackage ]
		ifNotEmpty: [ Smalltalk ui icons iconNamed: #dirtyMonticelloPackage ]
