API - storing
loadFromStore

	| array |
	self flag: #implementAnEncryptedVersion.
	
	"If I don't have a store file I do nothing"
	storeFile ifNil: [ ^ self ].
	
	"If the file is new, I cannot load it."
	storeFile exists ifFalse: [ ^ self ].
	
	array := FLMaterializer materializeFromFileNamed: storeFile resolve pathString.
	plainCredentials := array at: 1.
	sshCredentials := array at: 2.
