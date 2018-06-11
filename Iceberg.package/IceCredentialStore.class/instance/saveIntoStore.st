API - storing
saveIntoStore

	| serializer |
	
	self flag: #implementAnEncryptedVersion.
	
	storeFile ifNotNil: [  	
		storeFile resolve binaryWriteStreamDo: [ :stream | 
			serializer := FLSerializer on:  stream.
			serializer serialize: {plainCredentials. sshCredentials}]
	]