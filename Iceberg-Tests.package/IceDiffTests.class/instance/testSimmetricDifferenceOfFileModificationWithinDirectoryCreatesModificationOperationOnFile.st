tests
testSimmetricDifferenceOfFileModificationWithinDirectoryCreatesModificationOperationOnFile

	| left right diff leftMemoryFileSystem leftFileRef rightMemoryFileSystem rightFileRef |
	leftMemoryFileSystem := FileSystem memory.
	leftFileRef := leftMemoryFileSystem root / 'Readme.md'.
	leftFileRef writeStreamDo: [ :str | str nextPutAll: 'left' ].
	
	rightMemoryFileSystem := FileSystem memory.
	rightFileRef := rightMemoryFileSystem root / 'Readme.md'.
	rightFileRef writeStreamDo: [ :str | str nextPutAll: 'right' ].
	
	left := IceRootNode new.
	(left ensureDirectoryNamed: 'src')
		ensureFile: leftFileRef.
	
	right := IceRootNode new.
	(right ensureDirectoryNamed: 'src')
		ensureFile: rightFileRef.

	diff := left simmetricDifference: right.
	
	self assert: (diff / 'src' / 'Readme.md') isModification.
	self assert: (diff / 'src' / 'Readme.md') oldNode fileReference contents equals: 'left'.
	self assert: (diff / 'src' / 'Readme.md') modifiedNode fileReference contents equals: 'right'.