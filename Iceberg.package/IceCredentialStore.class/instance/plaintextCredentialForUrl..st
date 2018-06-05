API -  accessing
plaintextCredentialForUrl: aUrl
 
	^ self lookup: aUrl in: plainCredentials ifAbsent: [ IcePlaintextCredentials new ]