API - storing
storeInto: aCredentialStore forHostname: aHost 
	host := aHost.
	aCredentialStore storePlaintextCredential: self forHostname: aHost