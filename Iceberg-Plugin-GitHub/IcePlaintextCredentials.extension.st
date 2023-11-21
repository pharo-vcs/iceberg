Extension { #name : 'IcePlaintextCredentials' }

{ #category : '*Iceberg-Plugin-GitHub' }
IcePlaintextCredentials >> applyToRequest: aRequest [
	aRequest
		username: self username password: self password
]
