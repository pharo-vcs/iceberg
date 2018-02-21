tests-basic
testMergeLeftNodeWithRightEmptyRootNodeHasFileNode

	| mergedTree leftTree |
	leftTree := IceRootNode new.
	leftTree ensureFileNamed: 'Readme.md'.
	
	mergedTree := leftTree merge: IceRootNode new.
	
	self assert: (mergedTree / 'Readme.md') isFileDefinition