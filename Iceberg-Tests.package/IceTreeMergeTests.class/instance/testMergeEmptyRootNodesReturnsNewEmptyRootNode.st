tests-basic
testMergeEmptyRootNodesReturnsNewEmptyRootNode

	| mergedTree |
	mergedTree := IceRootNode new merge: IceRootNode new.
	
	self assert: mergedTree isRootDefinition.
	self assert: mergedTree isEmpty.