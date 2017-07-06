private
textForMergeable: mergeable
	mergeable = true ifTrue: [ ^ 'Yes' ].
	mergeable = false ifTrue: [ ^ 'There are conflicts' ].
	^ mergeable asString
	