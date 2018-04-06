private
responseWithValidationDo: aBlock
	| response |
	
	response := aBlock value.
	
	self handleUnauthorized: response.
	
	response isSuccess 
		ifFalse: [ IceGitHubError signalFor: response ].
	^ response