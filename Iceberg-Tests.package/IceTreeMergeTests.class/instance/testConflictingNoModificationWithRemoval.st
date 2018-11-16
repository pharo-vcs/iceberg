test-removals
testConflictingNoModificationWithRemoval

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