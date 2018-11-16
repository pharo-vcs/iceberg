tests
testDetectNotFoundElement
	self should: [ (IceNode value: 1) detect: [ :e | e value even ] ] raise: NotFound