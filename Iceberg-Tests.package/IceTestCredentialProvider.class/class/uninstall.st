installing
uninstall
	PreviousProvider ifNotNil: [ 
		self assert: (IceCredentialsProvider current isKindOf: self).

		IceCredentialsProvider current: PreviousProvider.
		PreviousProvider := nil.
	]
