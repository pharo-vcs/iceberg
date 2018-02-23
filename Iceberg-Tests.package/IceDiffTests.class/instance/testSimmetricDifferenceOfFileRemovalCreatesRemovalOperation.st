tests
testSimmetricDifferenceOfFileRemovalCreatesRemovalOperation

	| left right diff |
	left := IceNode new.
	right := IceNode new.
	right addChild: (IceFileDefinition named: 'Readme.md').
	
	diff := (IceTreeDiff from: left to: right) mergedTree.
	
	self assert: (diff / 'Readme.md') value isRemoval