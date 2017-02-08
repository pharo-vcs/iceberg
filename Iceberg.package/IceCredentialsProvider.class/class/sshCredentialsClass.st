accessing
sshCredentialsClass
	^ SshCredentialsClass ifNil: [ SshCredentialsClass := self defaultCredentialClass ]