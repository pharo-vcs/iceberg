tests-basic
testMergeLeftNodeWithRightEmptyRootNodeIsNotEmpty

	| mergedTree leftTree |
	leftTree := IceRootNode new.
	leftTree ensureFileNamed: 'Readme.md'.
	
	mergedTree := leftTree merge: IceRootNode new.
	
	self assert: mergedTree isRootDefinition.
	self deny: mergedTree isEmpty.