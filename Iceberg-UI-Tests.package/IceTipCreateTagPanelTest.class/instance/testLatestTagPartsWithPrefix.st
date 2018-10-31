tests
testLatestTagPartsWithPrefix
	panel := IceTipCreateTagPanel basicNew.
	self
		assert: (panel latestTagPartsIn: #('v2.1.2' 'v2.1.3' '3.1.7' '4.0.0' 'non-numeric'))
		equals: #('v' 2 1 3)