tests-basic
testMergeEmptyRootNodesReturnsNewEmptyRootNode

	| rightTree leftTree mergedTree |
	leftTree := rightTree := IceEmptyNode new.
	mergedTree := IceMerge new merge: leftTree into: rightTree.

	self assert: mergedTree isEmpty.