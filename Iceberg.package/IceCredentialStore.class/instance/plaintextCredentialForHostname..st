API -  accessing
plaintextCredentialForHostname: aHostname
 
	^ self lookup: aHostname in: plainCredentials ifAbsent: [ IcePlaintextCredentials new ]