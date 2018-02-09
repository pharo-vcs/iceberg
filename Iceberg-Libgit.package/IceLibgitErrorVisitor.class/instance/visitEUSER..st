visiting
visitEUSER: anError
	"user errors can just be handled by analysis of messageText :("
	anError messageText = 'No ssh-agent suitable credentials found.' 
		ifTrue: [ anError resignalAs: IceAuthenticationError new ].
	self visitGenericError: anError