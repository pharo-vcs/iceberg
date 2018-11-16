deprecated
plaintextCredentials
	
	self deprecated: '
	This method have been deprecated. The new CredentialStore keeps the keys by host. There is no default key for all the hosts.
	You should use:
	
		CredentialStore current plaintextCredentialForHostname: ''aHost.com''.
		
		This method will return an empty IcePlaintextCredentials for compatibility.
		
		
	Attention: Changing any script to use this new API, will break compatibility with Iceberg version < 1.1.0
	'.	

	^ IcePlaintextCredentials new