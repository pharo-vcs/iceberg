tests
testLatestTagPartsWithoutPrefix
	panel := IceTipCreateTagPanel basicNew.
	self
		assert: (panel latestTagPartsIn: #('3.1.7' '4.0.0' 'non-numeric'))
		equals: #('' 4 0 0)