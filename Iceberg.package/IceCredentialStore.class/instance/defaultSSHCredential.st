API -  accessing
defaultSSHCredential
 
	^ sshCredentials at:#'*' ifAbsentPut: [ IceSshCredentials new ].