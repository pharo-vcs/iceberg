tests
testTwoSimmetricDifferencesShouldGiveTheSameResult

	| left right leftMemoryFileSystem leftFileRef rightMemoryFileSystem rightFileRef diff1 diff2 leftSrc rightSrc |
	leftMemoryFileSystem := FileSystem memory.
	leftFileRef := leftMemoryFileSystem root / 'Readme.md'.
	leftFileRef writeStreamDo: [ :str | str nextPutAll: 'left' ].
	
	rightMemoryFileSystem := FileSystem memory.
	rightFileRef := rightMemoryFileSystem root / 'Readme.md'.
	rightFileRef writeStreamDo: [ :str | str nextPutAll: 'right' ].
	
	left := IceNode new.
	leftSrc := left addChild: (IceDirectoryDefinition named: 'src').
	leftSrc addChild: (IceFileDefinition named: 'Readme.md' path: (RelativePath with: 'Readme.md') fileReference: leftFileRef).
	
	right := IceNode new.
	rightSrc := right addChild: (IceDirectoryDefinition named: 'src').
	rightSrc addChild: (IceFileDefinition named: 'Readme.md' path: (RelativePath with: 'Readme.md') fileReference: rightFileRef).

	diff1 := IceDiff new diff: left with: right.
	diff2 := IceDiff new diff: left with: right.
	
	self assert: diff1 equals: diff2