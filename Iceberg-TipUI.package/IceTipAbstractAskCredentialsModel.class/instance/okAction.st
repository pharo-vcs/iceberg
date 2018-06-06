actions
okAction

	| cred |
	cred := self credentials.
	self storeCredentials ifTrue: [credentialStore storeCredential: cred forHostname: remoteHostname ].
	
	accepted := true.

	^ cred.