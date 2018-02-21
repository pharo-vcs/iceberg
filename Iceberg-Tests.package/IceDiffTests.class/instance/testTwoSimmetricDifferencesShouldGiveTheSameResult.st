tests
testTwoSimmetricDifferencesShouldGiveTheSameResult

	| left right leftMemoryFileSystem leftFileRef rightMemoryFileSystem rightFileRef diff1 diff2 |
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

	diff1 := left simmetricDifference: right.
	diff2 := left simmetricDifference: right.
	
	self assert: diff1 equals: diff2