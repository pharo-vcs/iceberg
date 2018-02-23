tests
testSimmetricDifferenceOfFileAdditionCreatesAdditionOperation

	| left right diff |
	left := IceNode new.	
	right := IceNode new.
	right ensureFileNamed: 'Readme.md'.
	
	diff := right simmetricDifference: left.
	
	self assert: (diff / 'Readme.md') isAddition