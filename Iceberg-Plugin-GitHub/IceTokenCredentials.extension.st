Extension { #name : 'IceTokenCredentials' }

{ #category : '*Iceberg-Plugin-GitHub' }
IceTokenCredentials >> applyToRequest: aRequest [

	token ifNil: [ ^ self ].

	aRequest
		headerAt: self authorizationHeaderKey
		put: self authorizationHeaderValue
]

{ #category : '*Iceberg-Plugin-GitHub' }
IceTokenCredentials >> authorizationHeaderKey [

	^ 'Authorization'
]

{ #category : '*Iceberg-Plugin-GitHub' }
IceTokenCredentials >> authorizationHeaderValue [

	^ 'Bearer ' , token
]
