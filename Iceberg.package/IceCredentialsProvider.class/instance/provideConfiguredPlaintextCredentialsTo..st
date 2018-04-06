actions
provideConfiguredPlaintextCredentialsTo: credentials
	self plaintextCredentials isPresent
		ifTrue: [ credentials readFrom: self plaintextCredentials ]
