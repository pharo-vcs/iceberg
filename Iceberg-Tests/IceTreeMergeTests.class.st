Class {
	#name : #IceTreeMergeTests,
	#superclass : #TestCase,
	#category : 'Iceberg-Tests-Changes'
}

{ #category : #'test-removals' }
IceTreeMergeTests >> buildTestTreeWithOperation: anOperation [

	^ (IceNode value: (IceNoModification definition: IceRootDefinition new))
		addChild: anOperation;
		yourself
]

{ #category : #'test-removals' }
IceTreeMergeTests >> testConflictingModificationWithRemoval [

	| rightTree leftTree mergedTree conflictOperation |
	leftTree := self buildTestTreeWithOperation: (IceRemoval definition: (IceTestDefinition named: 'common')).
	rightTree := self buildTestTreeWithOperation: (IceModification
			left: ((IceTestDefinition named: 'common')
				contents: 'new')
			right: ((IceTestDefinition named: 'common')
				contents: 'old')).
	
	mergedTree := IceMerge new merge: rightTree into: leftTree.
	
	conflictOperation := (mergedTree / 'common') value.
	self assert: conflictOperation isConflict.
	self assert: conflictOperation leftContents equals: 'new'.
	self assert: conflictOperation rightContents equals: ''.
]

{ #category : #'test-removals' }
IceTreeMergeTests >> testConflictingNoModificationWithRemoval [

	| rightTree leftTree mergedTree conflictOperation |
	leftTree := self buildTestTreeWithOperation: (IceRemoval definition: ((IceTestDefinition named: 'common')
		contents: 'contents')).
	rightTree := self buildTestTreeWithOperation: (IceNoModification definition: ((IceTestDefinition named: 'common')
		contents: 'contents')).
	
	mergedTree := IceMerge new merge: rightTree into: leftTree.

	conflictOperation := (mergedTree / 'common') value.
	self assert: conflictOperation isConflict.
	self assert: conflictOperation leftContents equals: 'contents'.
	self assert: conflictOperation rightContents equals: ''.
]

{ #category : #'test-removals' }
IceTreeMergeTests >> testConflictingRemovalWithModification [

	| rightTree leftTree mergedTree conflictOperation |
	leftTree := self buildTestTreeWithOperation: (IceRemoval definition: ((IceTestDefinition named: 'common')
		contents: 'old')).
	rightTree := self buildTestTreeWithOperation: (IceModification
		left: ((IceTestDefinition named: 'common')
			contents: 'new')
		right: ((IceTestDefinition named: 'common')
			contents: 'old')).
	
	mergedTree := IceMerge new merge: leftTree into: rightTree.
	
	conflictOperation := (mergedTree / 'common') value.
	self assert: conflictOperation isConflict.
	self assert: conflictOperation leftContents equals: ''.
	self assert: conflictOperation rightContents equals: 'new'.
]

{ #category : #'test-removals' }
IceTreeMergeTests >> testConflictingRemovalWithNoModification [

	| rightTree leftTree mergedTree conflictOperation |
	leftTree := self buildTestTreeWithOperation: (IceRemoval definition: ((IceTestDefinition named: 'common')
		contents: 'old')).
	rightTree := self buildTestTreeWithOperation: (IceNoModification definition: ((IceTestDefinition named: 'common')
		contents: 'old')).
	
	mergedTree := IceMerge new merge: leftTree into: rightTree.
	
	conflictOperation := (mergedTree / 'common') value.
	self assert: conflictOperation isConflict.
	self assert: conflictOperation leftContents equals: ''.
	self assert: conflictOperation rightContents equals: 'old'.
]

{ #category : #'test-additions' }
IceTreeMergeTests >> testMergeConflictingAdditions [

	| rightTree leftTree mergedTree conflictOperation |
	leftTree := self buildTestTreeWithOperation: (IceAddition definition: ((IceTestDefinition named: 'common')
		contents: 'new1')).
	rightTree := self buildTestTreeWithOperation: (IceAddition definition: ((IceTestDefinition named: 'common')
		contents: 'new2')).
	
	mergedTree := IceMerge new merge: leftTree into: rightTree.
	
	conflictOperation := (mergedTree / 'common') value.
	self assert: conflictOperation isConflict.
	self assert: conflictOperation leftContents equals: 'new1'.
	self assert: conflictOperation rightContents equals: 'new2'.
]

{ #category : #'tests-basic' }
IceTreeMergeTests >> testMergeEmptyRootNodesReturnsNewEmptyRootNode [

	| rightTree leftTree mergedTree |
	leftTree := rightTree := IceEmptyNode new.
	mergedTree := IceMerge new merge: leftTree into: rightTree.

	self assert: mergedTree isEmpty.
]

{ #category : #'test-removals' }
IceTreeMergeTests >> testMergeTwoEqualAdditionsIsNoModification [

	| rightTree leftTree mergedTree operation |
	leftTree := rightTree := self buildTestTreeWithOperation: (IceAddition definition: (IceTestDefinition named: 'new')).
	
	mergedTree := IceMerge new merge: leftTree into: rightTree.
	operation := (mergedTree / 'new') value.
	
	self assert: (mergedTree / 'new') isEmpty.
	self deny: operation isConflict.
	self deny: operation chosenOperation isModification.
]

{ #category : #'test-removals' }
IceTreeMergeTests >> testMergeTwoEqualRemovalsIsNoModification [

	| rightTree leftTree mergedTree operation |
	leftTree := rightTree := self buildTestTreeWithOperation: (IceRemoval definition: (IceTestDefinition named: 'old') ).
	
	mergedTree := IceMerge new merge: leftTree into: rightTree.
	operation := (mergedTree / 'old') value.
	
	self assert: (mergedTree / 'old') isEmpty.
	self deny: operation isConflict.
	self deny: operation chosenOperation isModification.
]

{ #category : #'test-modifications' }
IceTreeMergeTests >> testMergeTwoModificationsToDifferentDefinitionsInverseIsConflict [

	| rightTree leftTree mergedTree conflictOperation |
	leftTree := self buildTestTreeWithOperation: (IceNoModification definition: (IceTestDefinition named: 'common')).
	rightTree := self buildTestTreeWithOperation: (IceModification
		left: ((IceTestDefinition named: 'common')
			contents: 'new')
		right: ((IceTestDefinition named: 'common')
			contents: 'old')).
	
	mergedTree := IceMerge new merge: rightTree into: leftTree.
	
	conflictOperation := (mergedTree / 'common') value.
	self assert: conflictOperation isConflict not.
	self assert: conflictOperation rightContents equals: 'old'.
	self assert: conflictOperation leftContents equals: 'new'.
]

{ #category : #'test-modifications' }
IceTreeMergeTests >> testMergeTwoModificationsToDifferentDefinitionsIsConflict [

	| rightTree leftTree mergedTree conflictOperation |
	leftTree := self buildTestTreeWithOperation: (IceNoModification definition: ((IceTestDefinition named: 'common')
		contents: 'old')).
	rightTree := self buildTestTreeWithOperation: (IceModification
		left: ((IceTestDefinition named: 'common')
			contents: 'new')
		right: ((IceTestDefinition named: 'common')
			contents: 'old')).
	
	mergedTree := IceMerge new merge: leftTree into: rightTree.
	
	conflictOperation := (mergedTree / 'common') value.
	self assert: conflictOperation isConflict not.
	self assert: conflictOperation leftContents equals: 'new'.
	self assert: conflictOperation rightContents equals: 'old'.
]

{ #category : #'test-modifications' }
IceTreeMergeTests >> testMergeTwoModificationsToTheSameDefinitionIsNoModification [

	| rightTree leftTree mergedTree operation |
	leftTree := rightTree := self buildTestTreeWithOperation: (IceModification left: (IceTestDefinition named: 'm1' contents: 'old') right: (IceTestDefinition named: 'm1' contents: 'new')).
	
	mergedTree := IceMerge new merge: leftTree into: rightTree.
	operation := (mergedTree / 'm1') value.
	
	self assert: (mergedTree / 'm1') isEmpty.
	self deny: operation isConflict.
	self assert: operation chosenOperation isModification.
]
