tests-basic
testMergeConflictingTreesReturnsConflictingNodes

	| mergedTree leftTree rightTree |
	leftTree := IceRootNode new.
	leftTree ensureFileNamed: 'Readme.md'.

	rightTree := IceRootNode new.
	rightTree ensureDirectoryNamed: 'Readme.md'.
	
	mergedTree := leftTree merge: rightTree.
	
	self assert: (mergedTree / 'Readme.md') isConflictNode.
	self assert: (mergedTree / 'Readme.md') leftNode isFileDefinition.
	self assert: (mergedTree / 'Readme.md') rightNode isDirectoryDefinition.