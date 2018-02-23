tests
testSimmetricDifferenceOfFileAdditionCreatesAdditionOperation

	| left right diff |
	left := IceNode new.	
	right := IceNode new.
	right addChild: (IceFileDefinition named: 'Readme.md').
	
	diff := (IceTreeDiff from: right to: left) mergedTree.
	
	self assert: (diff / 'Readme.md') value isAddition