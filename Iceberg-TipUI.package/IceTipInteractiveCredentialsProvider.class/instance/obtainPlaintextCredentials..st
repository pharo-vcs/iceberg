private
obtainPlaintextCredentials: credentialsToReturn

	| returnedCred |
	returnedCred := IceTipAskForPlaintextCredentialsModel new
		credentialStore: self credentialStore;
		remoteUrl: remoteURL;
		open.
		
	
	credentialsToReturn readFrom: returnedCred