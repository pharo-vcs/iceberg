tests
testLatestTagPartsWithExtra
	panel := IceTipCreateTagPanel basicNew.
	self
		assert: (panel latestTagPartsIn: #('v1.0.0-alpha+001' 'v1.0.3+20130313144700'))
		equals: #('v' 1 0 3)