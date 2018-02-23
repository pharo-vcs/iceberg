tests
testSimmetricDifferenceOfEmptyTreesGivesEmptyDiff

	| left right diff |
	left := IceNode new.	
	right := IceNode new.
	
	diff := IceTreeDiff from: left to: right.
	
	self deny: diff mergedTree notEmpty