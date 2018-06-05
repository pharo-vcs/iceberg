API -  accessing
sshCredentialForUrl: aUrl
 
	^ self lookup: aUrl in: sshCredentials ifAbsent: [ IceSshCredentials new ].