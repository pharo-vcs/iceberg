tests
testSimmetricDifferenceOfFileAdditionCreatesAdditionOperation

	| left right diff |
	left := IceNode new.	
	right := IceNode new.
	right addChild: (IceFileDefinition named: 'Readme.md').
	
	diff := IceDiff new diff: left with: right.
	
	self assert: (diff / 'Readme.md') value isRemoval