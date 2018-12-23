tests
testLatestTagPartsPadded
	panel := IceTipCreateTagPanel basicNew.
	self assert: (panel latestTagPartsIn: #('v2.1')) equals: #('v' 2 1 0)