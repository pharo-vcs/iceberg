testing
referencesSameRemoteLocationAs: aRemote
	^ (super referencesSameRemoteLocationAs: aRemote)
		or: [ self url sameAs: aRemote httpsUrl ] 