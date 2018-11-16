test-removals
testConflictingModificationWithRemoval

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