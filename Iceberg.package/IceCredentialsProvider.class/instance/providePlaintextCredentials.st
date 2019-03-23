actions
providePlaintextCredentials
	^self plaintextCredentials isPresent
		ifTrue: [ self plaintextCredentials copy ]
		ifFalse: [ self providePlaintextCredentialsTo: IcePlaintextCredentials new ].