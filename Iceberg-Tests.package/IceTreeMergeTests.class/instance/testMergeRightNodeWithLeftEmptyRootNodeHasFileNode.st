tests-basic
testMergeRightNodeWithLeftEmptyRootNodeHasFileNode

	| mergedTree rightTree |
	rightTree := IceNode new.
	rightTree ensureFileNamed: 'Readme.md'.
	
	mergedTree := IceNode new merge: rightTree.
	
	self assert: (mergedTree / 'Readme.md') isFileDefinition