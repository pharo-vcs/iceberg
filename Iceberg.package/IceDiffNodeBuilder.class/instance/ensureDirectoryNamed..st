building
ensureDirectoryNamed: aString 
	
	^ parentNode
		childAt: aString
		ifAbsentPut: [ IceDirectoryNode name: aString parent: parentNode ]