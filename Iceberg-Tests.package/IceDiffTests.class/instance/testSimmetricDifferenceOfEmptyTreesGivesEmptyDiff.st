tests
testSimmetricDifferenceOfEmptyTreesGivesEmptyDiff

	| left right diff |
	left := IceNode new.	
	right := IceNode new.
	
	diff := left simmetricDifference: right.
	
	self deny: diff hasChanges