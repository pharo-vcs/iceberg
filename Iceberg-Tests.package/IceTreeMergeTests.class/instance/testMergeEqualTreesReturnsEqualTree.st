tests-basic
testMergeEqualTreesReturnsEqualTree

	| mergedTree leftTree rightTree |
	leftTree := IceRootNode new.
	leftTree ensureFileNamed: 'Readme.md'.

	rightTree := IceRootNode new.
	rightTree ensureFileNamed: 'Readme.md'.
	
	mergedTree := leftTree merge: rightTree.
	
	self assert: (mergedTree / 'Readme.md') isFileDefinition.