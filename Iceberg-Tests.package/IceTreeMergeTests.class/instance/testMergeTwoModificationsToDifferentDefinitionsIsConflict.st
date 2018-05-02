test-modifications
testMergeTwoModificationsToDifferentDefinitionsIsConflict

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