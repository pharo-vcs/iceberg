private
handleGitError: error
	"handle a received git error (probably this needs to be refactored, but I do not want to 
	 change much right now)"
	(error object = LGitErrorTypeEnum giterr_ssh)
		ifTrue: [ error resignalAs: IceAuthenticationError new ].
	error pass