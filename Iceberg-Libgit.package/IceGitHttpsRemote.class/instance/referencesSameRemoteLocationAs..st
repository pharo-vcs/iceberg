testing
referencesSameRemoteLocationAs: aRemote
	^ (super referencesSameRemoteLocationAs: aRemote)
		or: [ (self url withoutSuffix: '.git') sameAs: (aRemote httpsUrl withoutSuffix: '.git') ] 