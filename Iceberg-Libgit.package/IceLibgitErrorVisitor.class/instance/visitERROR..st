visiting
visitERROR: anError
	(anError object = LGitErrorTypeEnum giterr_ssh)
		ifTrue: [ anError resignalAs: IceAuthenticationError new ].
	(anError object value = LGitReturnCodeEnum git_euser value)
		ifTrue: [ self visitEUSER: anError  ].
	self visitGenericError: anError