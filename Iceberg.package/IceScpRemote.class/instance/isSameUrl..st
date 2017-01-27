testing
isSameUrl: aRemote
	^ (super isSameUrl: aRemote)
		or: [ self httpsUrl = aRemote httpsUrl ]