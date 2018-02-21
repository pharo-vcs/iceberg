tests-basic
testMergeRightNodeWithLeftEmptyRootNodeIsNotEmpty

	| mergedTree rightTree |
	rightTree := IceRootNode new.
	rightTree ensureFileNamed: 'Readme.md'.
	
	mergedTree := IceRootNode new merge: rightTree.
	
	self assert: mergedTree isRootDefinition.
	self deny: mergedTree isEmpty.