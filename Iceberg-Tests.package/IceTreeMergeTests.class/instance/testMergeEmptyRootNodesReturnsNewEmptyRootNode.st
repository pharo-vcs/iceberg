tests-basic
testMergeEmptyRootNodesReturnsNewEmptyRootNode

	| rightTree leftTree mergedTree |
	leftTree := rightTree := IceEmptyNode new.
	mergedTree := IceMerge new merge: leftTree with: rightTree.

	self assert: mergedTree isEmpty.