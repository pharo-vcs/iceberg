accessing
removeRemote: aRemote
	self backend removeRemote: aRemote.
	self workConfiguration detachRemote: aRemote
