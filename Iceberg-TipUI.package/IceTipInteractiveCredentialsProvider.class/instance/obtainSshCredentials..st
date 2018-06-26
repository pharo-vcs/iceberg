private
obtainSshCredentials: credentialsToReturn 
	
	| returnedCred |
	
	returnedCred := IceTipAskSSHCredentialsModel new
		credentials: self sshCredentials;
		credentialStore: self credentialStore;
		open.
		
	credentialsToReturn readFrom: returnedCred