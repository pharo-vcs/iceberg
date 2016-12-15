instance creation
forMCRepository: anIceMCGitRepository
	self halt. 
	^ (self origin: anIceMCGitRepository remoteUrl)
		repository: anIceMCGitRepository