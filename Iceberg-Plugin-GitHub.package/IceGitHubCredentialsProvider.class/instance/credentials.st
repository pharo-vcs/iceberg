accessing
credentials
	^ Credentials ifNil: [ Credentials := IcePlaintextCredentials new ]