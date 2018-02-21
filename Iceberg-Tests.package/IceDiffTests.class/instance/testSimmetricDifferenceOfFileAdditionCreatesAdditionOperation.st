tests
testSimmetricDifferenceOfFileAdditionCreatesAdditionOperation

	| left right diff |
	left := IceRootNode new.	
	right := IceRootNode new.
	right ensureFileNamed: 'Readme.md'.
	
	diff := right simmetricDifference: left.
	
	self assert: (diff / 'Readme.md') isAddition