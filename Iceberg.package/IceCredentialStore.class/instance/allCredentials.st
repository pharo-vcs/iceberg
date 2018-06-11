API - accessing
allCredentials
	self loadFromStore.
	self defaultSSHCredential.
	
	^ plainCredentials values , sshCredentials values