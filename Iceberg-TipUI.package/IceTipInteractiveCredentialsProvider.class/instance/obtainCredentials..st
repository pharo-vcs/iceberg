private
obtainCredentials: credentialsToReturn

	| returnedCred |
	returnedCred := credentialsToReturn askForModelClass new
		credentialStore: self credentialStore;
		remoteHostname: remote host;
		open.

	credentialsToReturn readFrom: returnedCred