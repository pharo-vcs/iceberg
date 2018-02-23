tests
testSelect

	| selected |
	selected := (IceNode value: 1) select: [ :e | e even ].
	self
		assert: selected isEmpty.
		
	selected := (IceNode value: 1) select: [ :e | e odd ].
	self
		assert: selected value
		equals: 1.