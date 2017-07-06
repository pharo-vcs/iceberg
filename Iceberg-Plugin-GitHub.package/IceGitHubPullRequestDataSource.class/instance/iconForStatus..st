private
iconForStatus: status
	status = 'success' ifTrue: [ ^ #testGreen asIcon ].
	status = 'failure' ifTrue: [ ^ #testRed asIcon ].
	status = 'pending' ifTrue: [ ^ #testYellow asIcon ].
	
	^ #testNotRun asIcon