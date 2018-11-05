private
iconNameForStatus: status
	status = 'success' ifTrue: [ ^ #testGreen ].
	status = 'failure' ifTrue: [ ^ #testRed ].
	status = 'pending' ifTrue: [ ^ #testYellow ].
	
	^ #testNotRun