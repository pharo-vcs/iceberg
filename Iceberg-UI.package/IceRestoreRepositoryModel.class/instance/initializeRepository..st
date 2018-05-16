initialization
initializeRepository: aRepository
	repository := aRepository.	
	self initialize.
	repository location ifNotNil: [ 
		remoteUrl text: repository origin url.
		localDirectoryLocation location: repository location ].
	 subdirectory text: repository subdirectory
