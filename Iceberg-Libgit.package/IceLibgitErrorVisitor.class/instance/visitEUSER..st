visiting
visitEUSER: anError
	"Since user errors do not have a code, they can can just be handled by analysis 
	 of messageText. String comparisson is not the thing in history, but for not it will 
	 fit. :("
	anError messageText = 'No ssh-agent suitable credentials found.'
		ifTrue: [ anError resignalAs: IceAuthenticationError new ].
	self visitGenericError: anError