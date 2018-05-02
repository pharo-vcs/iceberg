test-removals
testConflictingRemovalWithModification

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