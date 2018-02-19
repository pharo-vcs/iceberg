building
ensureFileNamed: aString 

	^ parentNode
		childAt: aString
		ifAbsentPut: [ IceFileNode name: aString parent: parentNode ]