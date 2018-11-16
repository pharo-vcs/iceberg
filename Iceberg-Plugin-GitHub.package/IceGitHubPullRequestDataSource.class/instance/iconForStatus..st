private
iconForStatus: status
	status = 'success' ifTrue: [ ^ self iconNamed: #testGreen ].
	status = 'failure' ifTrue: [ ^ self iconNamed: #testRed ].
	status = 'pending' ifTrue: [ ^ self iconNamed: #testYellow ].
	
	^ self iconNamed: #testNotRun