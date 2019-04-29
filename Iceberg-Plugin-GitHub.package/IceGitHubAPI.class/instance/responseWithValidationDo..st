private
responseWithValidationDo: aBlock
	| response |
	
	response := aBlock value.
	
	self handleUnauthorized: response.
	
	response isSuccess 
		ifFalse: [ 
			"Your repository is already cloned, but without metadata
	Small fix is to 'import from existing clone' to have your repository displayed in Iceberg.
	
	This appears because Iceberg is trying to get the repository meta data without having your credentials which isn't possible on a private repository."
			IceGitHubError signalFor: response 
			].
	^ response