tests
testSimmetricDifferenceOfFileModificationCreatesModificationOperation

	| left right diff leftMemoryFileSystem leftFileRef rightMemoryFileSystem rightFileRef |
	leftMemoryFileSystem := FileSystem memory.
	leftFileRef := leftMemoryFileSystem root / 'Readme.md'.
	leftFileRef writeStreamDo: [ :str | str nextPutAll: 'left' ].
	
	rightMemoryFileSystem := FileSystem memory.
	rightFileRef := rightMemoryFileSystem root / 'Readme.md'.
	rightFileRef writeStreamDo: [ :str | str nextPutAll: 'right' ].
	
	left := IceRootNode new.
	left ensureFile: leftFileRef.
	
	right := IceRootNode new.
	right ensureFile: rightFileRef.

	diff := left simmetricDifference: right.
	
	self assert: (diff / 'Readme.md') isModification.
	self assert: (diff / 'Readme.md') rightDefinition fileReference contents equals: 'left'.
	self assert: (diff / 'Readme.md') leftDefinition fileReference contents equals: 'right'.