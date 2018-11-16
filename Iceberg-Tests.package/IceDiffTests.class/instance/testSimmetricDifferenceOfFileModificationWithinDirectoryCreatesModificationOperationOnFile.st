tests
testSimmetricDifferenceOfFileModificationWithinDirectoryCreatesModificationOperationOnFile

	| left right diff leftMemoryFileSystem leftFileRef rightMemoryFileSystem rightFileRef leftSrc rightSrc |
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

	diff := IceDiff new diff: left with: right.
	
	self assert: (diff / 'src' / 'Readme.md') value isModification.
	self assert: (diff / 'src' / 'Readme.md') value leftDefinition contents equals: 'left'.
	self assert: (diff / 'src' / 'Readme.md') value rightDefinition contents equals: 'right'.