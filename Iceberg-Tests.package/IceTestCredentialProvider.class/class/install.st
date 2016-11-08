installing
install
	PreviousProvider 
		ifNil: [
			PreviousProvider := IceCredentialsProvider current.
			IceCredentialsProvider current: self new.
		]
		ifNotNil: [ self assert: (IceCredentialsProvider current isKindOf: self) ]
	