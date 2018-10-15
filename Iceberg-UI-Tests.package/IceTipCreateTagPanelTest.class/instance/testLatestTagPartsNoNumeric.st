tests
testLatestTagPartsNoNumeric
	panel := IceTipCreateTagPanel basicNew.
	self assert: (panel latestTagPartsIn: #()) equals: #('v' 0 0 0).
	self assert: (panel latestTagPartsIn: #('non-numeric')) equals: #('v' 0 0 0)