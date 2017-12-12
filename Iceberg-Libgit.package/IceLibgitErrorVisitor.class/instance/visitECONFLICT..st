visiting
visitECONFLICT: anError
	anError object =  LGitErrorTypeEnum giterr_checkout
		ifTrue: [ ^ anError resignalAs: IceCheckoutConflictError new ].
	self visitGenericError: anError