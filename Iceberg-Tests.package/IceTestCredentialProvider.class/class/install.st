installing
install
	PreviousProvider 
		ifNil: [
			PreviousProvider := IceCredentialsProvider providerType.
			IceCredentialsProvider providerType: self.
		]
		ifNotNil: [ self assert: (IceCredentialsProvider providerType = self) ]
	