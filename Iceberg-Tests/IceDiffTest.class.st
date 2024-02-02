Class {
	#name : 'IceDiffTest',
	#superclass : 'TestCase',
	#category : 'Iceberg-Tests-Changes',
	#package : 'Iceberg-Tests',
	#tag : 'Changes'
}

{ #category : 'tests' }
IceDiffTest >> testSimmetricDifferenceOfEmptyTreesGivesEmptyDiff [

	| left right diff |
	left := IceNode new.	
	right := IceNode new.
	
	diff := IceDiff new diff: left with: right.
	
	self deny: diff notEmpty
]

{ #category : 'tests' }
IceDiffTest >> testSimmetricDifferenceOfFileAdditionCreatesAdditionOperation [

	| left right diff |
	left := IceNode new.	
	right := IceNode new.
	right addChild: (IceFileDefinition named: 'Readme.md').
	
	diff := IceDiff new diff: left with: right.
	
	self assert: (diff / 'Readme.md') value isRemoval
]

{ #category : 'tests' }
IceDiffTest >> testSimmetricDifferenceOfFileModificationCreatesModificationOperation [

	| left right diff leftMemoryFileSystem leftFileRef rightMemoryFileSystem rightFileRef |
	leftMemoryFileSystem := FileSystem memory.
	leftFileRef := leftMemoryFileSystem root / 'Readme.md'.
	leftFileRef writeStreamDo: [ :str | str nextPutAll: 'left' ].
	
	rightMemoryFileSystem := FileSystem memory.
	rightFileRef := rightMemoryFileSystem root / 'Readme.md'.
	rightFileRef writeStreamDo: [ :str | str nextPutAll: 'right' ].
	
	left := IceNode new.
	left addChild: (IceFileDefinition named: 'Readme.md' path: (RelativePath with: 'Readme.md') fileReference: leftFileRef).
	
	right := IceNode new.
	right addChild: (IceFileDefinition named: 'Readme.md' path: (RelativePath with: 'Readme.md') fileReference: rightFileRef).

	diff := IceDiff new diff: left with: right.
	
	self assert: (diff / 'Readme.md') value isModification.
	self assert: (diff / 'Readme.md') value leftDefinition contents equals: 'left'.
	self assert: (diff / 'Readme.md') value rightDefinition contents equals: 'right'.
]

{ #category : 'tests' }
IceDiffTest >> testSimmetricDifferenceOfFileModificationWithinDirectoryCreatesModificationOnDirectory [

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
]

{ #category : 'tests' }
IceDiffTest >> testSimmetricDifferenceOfFileModificationWithinDirectoryCreatesModificationOperationOnFile [

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
]

{ #category : 'tests' }
IceDiffTest >> testSimmetricDifferenceOfFileRemovalCreatesRemovalOperation [

	| left right diff |
	left := IceNode new.
	right := IceNode new.
	right addChild: (IceFileDefinition named: 'Readme.md').
	
	diff := IceDiff new diff: left with: right.
	
	self assert: (diff / 'Readme.md') value isRemoval
]

{ #category : 'tests' }
IceDiffTest >> testTwoSimmetricDifferencesShouldGiveTheSameResult [

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
]
