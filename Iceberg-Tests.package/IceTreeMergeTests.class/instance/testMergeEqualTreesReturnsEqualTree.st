tests-basic
"tests-basic"
testMergeEqualTreesReturnsEqualTree

	| mergedTree leftTree rightTree |
	leftTree := IceNode new.
	leftTree ensureFileNamed: 'Readme.md'.

	rightTree := IceNode new.
	rightTree ensureFileNamed: 'Readme.md'.
	
	mergedTree := leftTree merge: rightTree.
	
	self assert: (mergedTree / 'Readme.md') isFileDefinition.