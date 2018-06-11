private
iconForMergeable: mergeable
	mergeable = true ifTrue: [ ^ self iconNamed: #smallOk ].
	^ self iconNamed: #smallCancel