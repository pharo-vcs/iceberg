tests-basic
"tests-basic"
testMergeRightNodeWithLeftEmptyRootNodeIsNotEmpty

	| mergedTree rightTree |
	rightTree := IceNode new.
	rightTree ensureFileNamed: 'Readme.md'.
	
	mergedTree := IceNode new merge: rightTree.
	
	self assert: mergedTree isRootDefinition.
	self deny: mergedTree isEmpty.