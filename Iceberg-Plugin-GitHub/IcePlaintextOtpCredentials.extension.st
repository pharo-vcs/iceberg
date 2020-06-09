Extension { #name : #IcePlaintextOtpCredentials }

{ #category : #'*Iceberg-Plugin-GitHub' }
IcePlaintextOtpCredentials >> applyToRequest: aRequest [
	super applyToRequest: aRequest.
	self token ifNotNil: [:aToken |
		aRequest headerAt: 'X-Github-OTP' put: aToken ].
]
