tests-basic
testMergeConflictingTreesReturnsConflictingNodes

	| mergedTree leftTree rightTree |
	leftTree := IceNode new.
	leftTree ensureFileNamed: 'Readme.md'.

	rightTree := IceNode new.
	rightTree ensureDirectoryNamed: 'Readme.md'.
	
	mergedTree := leftTree merge: rightTree.
	
	self assert: (mergedTree / 'Readme.md') isConflictNode.
	self assert: (mergedTree / 'Readme.md') leftNode isFileDefinition.
	self assert: (mergedTree / 'Readme.md') rightNode isDirectoryDefinition.