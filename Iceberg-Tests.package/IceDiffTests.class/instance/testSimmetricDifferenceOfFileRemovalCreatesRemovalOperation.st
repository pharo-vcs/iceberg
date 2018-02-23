tests
"tests"
testSimmetricDifferenceOfFileRemovalCreatesRemovalOperation

	| left right diff |
	left := IceNode new.
	right := IceNode new.
	right ensureFileNamed: 'Readme.md'.
	
	diff := left simmetricDifference: right.
	
	self assert: (diff / 'Readme.md') isRemoval