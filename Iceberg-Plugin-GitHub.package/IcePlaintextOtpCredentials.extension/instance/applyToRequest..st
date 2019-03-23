*Iceberg-Plugin-GitHub
applyToRequest: aRequest
	super applyToRequest: aRequest.
	self token ifNotNil: [:aToken |
		aRequest headerAt: 'X-Github-OTP' put: aToken ].