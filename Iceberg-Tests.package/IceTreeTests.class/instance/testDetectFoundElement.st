tests
testDetectFoundElement

	| selected |
	selected := (IceNode value: 2) detect: [ :e | e value even ].

	self assert: selected equals: 2