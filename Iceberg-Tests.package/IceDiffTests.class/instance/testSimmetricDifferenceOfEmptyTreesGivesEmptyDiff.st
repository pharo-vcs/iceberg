tests
testSimmetricDifferenceOfEmptyTreesGivesEmptyDiff

	| left right diff |
	left := IceNode new.	
	right := IceNode new.
	
	diff := IceDiff new diff: left with: right.
	
	self deny: diff notEmpty