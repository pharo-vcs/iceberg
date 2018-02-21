tests-basic
testMergeRightNodeWithLeftEmptyRootNodeHasFileNode

	| mergedTree rightTree |
	rightTree := IceRootNode new.
	rightTree ensureFileNamed: 'Readme.md'.
	
	mergedTree :=  IceRootNode new merge: rightTree.
	
	self assert: (mergedTree / 'Readme.md') isFileDefinition