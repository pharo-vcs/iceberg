API -  accessing
sshCredentialForUrl: aHostname
 
	^ self lookup: aHostname in: sshCredentials ifAbsent: [ self defaultSSHCredential ].