testing
isSame: aRemote
	^ (self isSameUrl: aRemote)
		and: [ self remoteName = aRemote remoteName ]