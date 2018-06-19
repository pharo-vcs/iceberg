tests
testSimmetricDifferenceOfFileModificationWithinDirectoryCreatesModificationOnDirectory

	| left right diff leftMemoryFileSystem leftFileRef rightMemoryFileSystem rightFileRef |
	leftMemoryFileSystem := FileSystem memory.
	leftFileRef := leftMemoryFileSystem root / 'Readme.md'.
	leftFileRef writeStreamDo: [ :str | str nextPutAll: 'left' ].
	
	rightMemoryFileSystem := FileSystem memory.
	rightFileRef := rightMemoryFileSystem root / 'Readme.md'.
	rightFileRef writeStreamDo: [ :str | str nextPutAll: 'right' ].
	
	left := IceNode new.
	left addChild: (IceFileDefinition named: 'src' path: (RelativePath with: 'src') fileReference: leftFileRef).
	
	right := IceNode new.
	right addChild: (IceFileDefinition named: 'src' path: (RelativePath with: 'src') fileReference: rightFileRef).

	diff := IceDiff new diff: left with: right.

	self assert: (diff / 'src') value isModification