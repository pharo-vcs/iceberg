installing
uninstall
	PreviousProvider ifNotNil: [ 
		self assert: (IceCredentialsProvider providerType = self).

		IceCredentialsProvider providerType: PreviousProvider.
		PreviousProvider := nil.
	]
