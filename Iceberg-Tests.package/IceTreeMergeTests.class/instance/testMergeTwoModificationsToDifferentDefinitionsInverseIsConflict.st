test-modifications
testMergeTwoModificationsToDifferentDefinitionsInverseIsConflict

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