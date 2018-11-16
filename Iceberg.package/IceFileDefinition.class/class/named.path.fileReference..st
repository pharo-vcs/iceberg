instance-creation
named: aString path: aPath fileReference: aFileReference
	^ self
		named: aString
		path: aPath
		contents: (aFileReference binaryReadStreamDo: [ :each | each upToEnd ])