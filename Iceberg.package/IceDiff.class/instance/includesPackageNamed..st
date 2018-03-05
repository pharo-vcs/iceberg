testing
includesPackageNamed: aString 
	self isEmpty ifTrue: [ ^ false ].
 	^ self codeSubdirectoryNode includesKey: aString