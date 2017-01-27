testing
isSameUrl: aRemote
	^ (super isSameUrl: aRemote)
		or: [ self url = aRemote httpsUrl ] 