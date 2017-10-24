comparing
referencesSameRemoteLocationAs: another
	^ (self url withoutSuffix: '.git') sameAs: (another url withoutSuffix: '.git')