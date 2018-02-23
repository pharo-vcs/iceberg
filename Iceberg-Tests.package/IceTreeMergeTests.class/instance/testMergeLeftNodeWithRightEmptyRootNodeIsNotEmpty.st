tests-basic
testMergeLeftNodeWithRightEmptyRootNodeIsNotEmpty

	| mergedTree leftTree |
	leftTree := IceNode new.
	leftTree ensureFileNamed: 'Readme.md'.
	
	mergedTree := leftTree merge: IceNode new.
	
	self assert: mergedTree isRootDefinition.
	self deny: mergedTree isEmpty.