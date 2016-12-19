accessing
pullRemote
	^ pullRemote ifNil: [ self pushRemote ]