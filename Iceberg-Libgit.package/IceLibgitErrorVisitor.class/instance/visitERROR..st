visiting
visitERROR: anError

	(anError object = LGitErrorTypeEnum giterr_ssh)
		ifTrue: [ anError resignalAs: IceAuthenticationError new ].
	"user errors needs to be handled differently, since they do not have an 
	 actual code. This is a HACK, but it will fix #577"
	(anError object value = LGitReturnCodeEnum git_euser value)
		ifTrue: [ self visitEUSER: anError  ].
	self visitGenericError: anError