Class {
	#name : 'IceTreeMergeTest',
	#superclass : 'TestCase',
	#category : 'Iceberg-Tests-Changes',
	#package : 'Iceberg-Tests',
	#tag : 'Changes'
}

{ #category : 'test-removals' }
IceTreeMergeTest >> buildTestTreeWithOperation: anOperation [

	^ (IceNode value: (IceNoModification definition: IceRootDefinition new))
		addChild: anOperation;
		yourself
]

{ #category : 'test-removals' }
IceTreeMergeTest >> testConflictingModificationWithRemoval [

	| rightTree leftTree mergedTree conflictOperation |
	leftTree := self buildTestTreeWithOperation: (IceRemoval definition: (IceTestDefinition named: 'common')).
	rightTree := self buildTestTreeWithOperation: (IceModification
			left: ((IceTestDefinition named: 'common')
				contents: 'new')
			right: ((IceTestDefinition named: 'common')
				contents: 'old')).
	
	mergedTree := IceTreeMerger new merge: rightTree into: leftTree.
	
	conflictOperation := (mergedTree / 'common') value.
	self assert: conflictOperation isConflict.
	self assert: conflictOperation leftContents equals: 'new'.
	self assert: conflictOperation rightContents equals: ''.
]

{ #category : 'test-removals' }
IceTreeMergeTest >> testConflictingNoModificationWithRemoval [

	| rightTree leftTree mergedTree conflictOperation |
	leftTree := self buildTestTreeWithOperation: (IceRemoval definition: ((IceTestDefinition named: 'common')
		contents: 'contents')).
	rightTree := self buildTestTreeWithOperation: (IceNoModification definition: ((IceTestDefinition named: 'common')
		contents: 'contents')).
	
	mergedTree := IceTreeMerger new merge: rightTree into: leftTree.

	conflictOperation := (mergedTree / 'common') value.
	self assert: conflictOperation isConflict.
	self assert: conflictOperation leftContents equals: 'contents'.
	self assert: conflictOperation rightContents equals: ''.
]

{ #category : 'test-removals' }
IceTreeMergeTest >> testConflictingRemovalWithModification [

	| rightTree leftTree mergedTree conflictOperation |
	leftTree := self buildTestTreeWithOperation: (IceRemoval definition: ((IceTestDefinition named: 'common')
		contents: 'old')).
	rightTree := self buildTestTreeWithOperation: (IceModification
		left: ((IceTestDefinition named: 'common')
			contents: 'new')
		right: ((IceTestDefinition named: 'common')
			contents: 'old')).
	
	mergedTree := IceTreeMerger new merge: leftTree into: rightTree.
	
	conflictOperation := (mergedTree / 'common') value.
	self assert: conflictOperation isConflict.
	self assert: conflictOperation leftContents equals: ''.
	self assert: conflictOperation rightContents equals: 'new'.
]

{ #category : 'test-removals' }
IceTreeMergeTest >> testConflictingRemovalWithNoModification [

	| rightTree leftTree mergedTree conflictOperation |
	leftTree := self buildTestTreeWithOperation: (IceRemoval definition: ((IceTestDefinition named: 'common')
		contents: 'old')).
	rightTree := self buildTestTreeWithOperation: (IceNoModification definition: ((IceTestDefinition named: 'common')
		contents: 'old')).
	
	mergedTree := IceTreeMerger new merge: leftTree into: rightTree.
	
	conflictOperation := (mergedTree / 'common') value.
	self assert: conflictOperation isConflict.
	self assert: conflictOperation leftContents equals: ''.
	self assert: conflictOperation rightContents equals: 'old'.
]

{ #category : 'test-additions' }
IceTreeMergeTest >> testMergeConflictingAdditions [

	| rightTree leftTree mergedTree conflictOperation |
	leftTree := self buildTestTreeWithOperation: (IceAddition definition: ((IceTestDefinition named: 'common')
		contents: 'new1')).
	rightTree := self buildTestTreeWithOperation: (IceAddition definition: ((IceTestDefinition named: 'common')
		contents: 'new2')).
	
	mergedTree := IceTreeMerger new merge: leftTree into: rightTree.
	
	conflictOperation := (mergedTree / 'common') value.
	self assert: conflictOperation isConflict.
	self assert: conflictOperation leftContents equals: 'new1'.
	self assert: conflictOperation rightContents equals: 'new2'.
]

{ #category : 'tests-basic' }
IceTreeMergeTest >> testMergeEmptyRootNodesReturnsNewEmptyRootNode [

	| rightTree leftTree mergedTree |
	leftTree := rightTree := IceEmptyNode new.
	mergedTree := IceTreeMerger new merge: leftTree into: rightTree.

	self assert: mergedTree isEmpty.
]

{ #category : 'test-removals' }
IceTreeMergeTest >> testMergeTwoEqualAdditionsIsNoModification [

	| rightTree leftTree mergedTree operation |
	leftTree := rightTree := self buildTestTreeWithOperation: (IceAddition definition: (IceTestDefinition named: 'new')).
	
	mergedTree := IceTreeMerger new merge: leftTree into: rightTree.
	operation := (mergedTree / 'new') value.
	
	self assert: (mergedTree / 'new') isEmpty.
	self deny: operation isConflict.
	self deny: operation chosenOperation isModification.
]

{ #category : 'test-removals' }
IceTreeMergeTest >> testMergeTwoEqualRemovalsIsNoModification [

	| rightTree leftTree mergedTree operation |
	leftTree := rightTree := self buildTestTreeWithOperation: (IceRemoval definition: (IceTestDefinition named: 'old') ).
	
	mergedTree := IceTreeMerger new merge: leftTree into: rightTree.
	operation := (mergedTree / 'old') value.
	
	self assert: (mergedTree / 'old') isEmpty.
	self deny: operation isConflict.
	self deny: operation chosenOperation isModification.
]

{ #category : 'test-modifications' }
IceTreeMergeTest >> testMergeTwoModificationsToDifferentDefinitionsInverseIsConflict [

	| rightTree leftTree mergedTree conflictOperation |
	leftTree := self buildTestTreeWithOperation: (IceNoModification definition: (IceTestDefinition named: 'common')).
	rightTree := self buildTestTreeWithOperation: (IceModification
		left: ((IceTestDefinition named: 'common')
			contents: 'new')
		right: ((IceTestDefinition named: 'common')
			contents: 'old')).
	
	mergedTree := IceTreeMerger new merge: rightTree into: leftTree.
	
	conflictOperation := (mergedTree / 'common') value.
	self assert: conflictOperation isConflict not.
	self assert: conflictOperation rightContents equals: 'old'.
	self assert: conflictOperation leftContents equals: 'new'.
]

{ #category : 'test-modifications' }
IceTreeMergeTest >> testMergeTwoModificationsToDifferentDefinitionsIsConflict [

	| rightTree leftTree mergedTree conflictOperation |
	leftTree := self buildTestTreeWithOperation: (IceNoModification definition: ((IceTestDefinition named: 'common')
		contents: 'old')).
	rightTree := self buildTestTreeWithOperation: (IceModification
		left: ((IceTestDefinition named: 'common')
			contents: 'new')
		right: ((IceTestDefinition named: 'common')
			contents: 'old')).
	
	mergedTree := IceTreeMerger new merge: leftTree into: rightTree.
	
	conflictOperation := (mergedTree / 'common') value.
	self assert: conflictOperation isConflict not.
	self assert: conflictOperation leftContents equals: 'new'.
	self assert: conflictOperation rightContents equals: 'old'.
]

{ #category : 'test-modifications' }
IceTreeMergeTest >> testMergeTwoModificationsToTheSameDefinitionIsNoModification [

	| rightTree leftTree mergedTree operation |
	leftTree := rightTree := self buildTestTreeWithOperation: (IceModification left: (IceTestDefinition named: 'm1' contents: 'old') right: (IceTestDefinition named: 'm1' contents: 'new')).
	
	mergedTree := IceTreeMerger new merge: leftTree into: rightTree.
	operation := (mergedTree / 'm1') value.
	
	self assert: (mergedTree / 'm1') isEmpty.
	self deny: operation isConflict.
	self assert: operation chosenOperation isModification.
]
