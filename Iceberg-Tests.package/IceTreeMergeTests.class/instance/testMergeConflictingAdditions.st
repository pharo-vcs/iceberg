test-additions
testMergeConflictingAdditions

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