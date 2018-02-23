tests-basic
"tests-basic"
testMergeLeftNodeWithRightEmptyRootNodeHasFileNode

	| mergedTree leftTree |
	leftTree := IceNode new.
	leftTree ensureFileNamed: 'Readme.md'.
	
	mergedTree := leftTree merge: IceNode new.
	
	self assert: (mergedTree / 'Readme.md') isFileDefinition