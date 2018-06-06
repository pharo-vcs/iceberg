API -  accessing
plaintextCredentialForUrl: aHostname
 
	^ self lookup: aHostname in: plainCredentials ifAbsent: [ IcePlaintextCredentials new ]