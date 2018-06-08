API -  accessing
sshCredentialForHostname: aHostname
 
	^ self lookup: aHostname in: sshCredentials ifAbsent: [ self defaultSSHCredential ].