testing
isSame: aRemote
	^ (self referencesSameRemoteLocationAs: aRemote)
		and: [ self name = aRemote name ]