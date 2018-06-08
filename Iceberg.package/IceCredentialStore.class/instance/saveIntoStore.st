API - storing
saveIntoStore

	| serializer |
	
	self flag: #implementAnEncryptedVersion.
	
	storeFile ifNotNil: [  
		serializer := FLSerializer on: storeFile resolve binaryWriteStream.
		serializer serialize: {plainCredentials. sshCredentials}.
	]