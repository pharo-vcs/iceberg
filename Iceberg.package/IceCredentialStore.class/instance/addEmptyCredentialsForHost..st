API - storing
addEmptyCredentialsForHost: aHostname 
	
	plainCredentials at: aHostname put: (IcePlaintextCredentials new)