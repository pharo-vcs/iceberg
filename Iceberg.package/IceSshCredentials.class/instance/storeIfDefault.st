private - storing
storeIfDefault
	
	self isDefault ifFalse: [ ^ self ].
	IceCredentialStore current storeCredential: self.