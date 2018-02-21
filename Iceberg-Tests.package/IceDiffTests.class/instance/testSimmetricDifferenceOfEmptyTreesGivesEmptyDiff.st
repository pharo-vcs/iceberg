tests
testSimmetricDifferenceOfEmptyTreesGivesEmptyDiff

	| left right diff |
	left := IceRootNode new.	
	right := IceRootNode new.
	
	diff := left simmetricDifference: right.
	
	self deny: diff hasChanges