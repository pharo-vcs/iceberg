tests
testLatestTagPartsNoNumeric2
	panel := IceTipCreateTagPanel basicNew.
	self assert: (panel latestTagPartsIn: #('v1.2.x')) equals: #('v' 1 2 0).
	self assert: (panel latestTagPartsIn: #('v1.x')) equals: #('v' 1 0 0).