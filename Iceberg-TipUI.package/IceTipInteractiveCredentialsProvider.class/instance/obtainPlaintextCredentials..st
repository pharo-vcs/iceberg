private
obtainPlaintextCredentials: credentialsToReturn

	| returnedCred |
	returnedCred := IceTipAskForPlaintextCredentialsModel new
		credentialStore: self credentialStore;
		remoteHostname: remote host;
		open.
		
	
	credentialsToReturn readFrom: returnedCred