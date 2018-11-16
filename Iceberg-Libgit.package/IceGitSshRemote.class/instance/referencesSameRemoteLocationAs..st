testing
referencesSameRemoteLocationAs: aRemote
	^ ((super referencesSameRemoteLocationAs: aRemote)
		or: [ self httpsUrl sameAs: aRemote httpsUrl ])
			