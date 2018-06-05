private - storing
storeSshCredential: credential forUrl: aUrl
 
	sshCredentials at: (self buildKey: (self parseUrl: aUrl)) put: credential