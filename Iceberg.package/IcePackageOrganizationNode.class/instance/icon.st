initialization
icon
	
	^ operations size = 1
		ifTrue: [ operations anyOne icon ]
		ifFalse: [ Smalltalk ui icons iconNamed: #dirtyMonticelloPackage ]