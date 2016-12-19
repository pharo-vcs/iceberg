accessing
detachRemote: aRemote
	(self pushingRemote isSame: aRemote) ifTrue: [ self pushingRemote: nil ].
	(self pullingRemote isSame: aRemote) ifTrue: [ self pullingRemote: nil ]