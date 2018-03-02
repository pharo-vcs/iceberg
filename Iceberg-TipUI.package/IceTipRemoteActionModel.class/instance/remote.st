accessing
remote
	^ remote ifNil: [ self entity pullRemote ]