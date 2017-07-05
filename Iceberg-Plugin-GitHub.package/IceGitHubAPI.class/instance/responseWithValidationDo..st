private
responseWithValidationDo: aBlock
	| response |
	
	response := aBlock value.
	response isSuccess 
		ifFalse: [ IceGitHubError signalFor: response ].
	^ response