visiting
visitERROR: anError
	(anError object = LGitErrorTypeEnum giterr_ssh)
		ifTrue: [ anError resignalAs: IceAuthenticationError new ].
	self visitGenericError: anError