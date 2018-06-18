deprecated
plaintextCredentials: anIcePlaintextCredentials 
	
	self deprecated: '
	This API has been deprecated. The new CredentialStore hosts the keys by hostname. 
	The code should be changed to: 
		IceCredentialStore current
		storeCredential: (IcePlaintextCredentials new 
			username: ''user'';
			password: ''password'';
			host: ''github.com'';
			yourself).

	However this modification will break with older versions of Iceberg ( < 1.1.0 ).
	
	This method does nothing for compatibility.'
