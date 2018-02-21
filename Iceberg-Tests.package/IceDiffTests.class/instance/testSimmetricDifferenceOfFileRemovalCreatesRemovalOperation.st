tests
testSimmetricDifferenceOfFileRemovalCreatesRemovalOperation

	| left right diff |
	left := IceRootNode new.	
	right := IceRootNode new.
	right ensureFileNamed: 'Readme.md'.
	
	diff := left simmetricDifference: right.
	
	self assert: (diff / 'Readme.md') isRemoval