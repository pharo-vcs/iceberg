tests-basic
testMergeEmptyRootNodesReturnsNewEmptyRootNode

	| mergedTree |
	mergedTree := IceNode new merge: IceNode new.
	
	self assert: mergedTree isRootDefinition.
	self assert: mergedTree isEmpty.