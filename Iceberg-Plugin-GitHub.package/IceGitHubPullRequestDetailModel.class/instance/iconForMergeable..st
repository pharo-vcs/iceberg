private
iconForMergeable: mergeable
	mergeable = true ifTrue: [ ^ #smallOk asIcon ].
	^ #smallCancel asIcon