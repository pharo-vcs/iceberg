private - storing
storePlaintextCredential: credential forUrl: aUrl
 
	plainCredentials at: (self buildKey: (self parseUrl: aUrl)) put: credential