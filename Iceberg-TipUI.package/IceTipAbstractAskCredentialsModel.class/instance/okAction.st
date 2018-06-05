actions
okAction

	| cred |
	cred := self credentials.
	self storeCredentials ifTrue: [credentialStore storeCredential: cred forUrl: remoteUrl asString].
	
	accepted := true.

	^ cred.