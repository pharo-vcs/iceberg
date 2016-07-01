auxiliar
tempDirectories
	^ { 
		self defaultLocationForLocalClonedRepository.
		self defaultLocationForGithubClonedRepository.
	}