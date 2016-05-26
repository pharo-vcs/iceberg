accessing
repositoryForPackage: anRPackage 
	| existingRepositories possibleRepositoryTypes |
	existingRepositories := (MCWorkingCopy forPackage: anRPackage mcPackage) repositoryGroup repositories.
	possibleRepositoryTypes := { IceMCGitRepository. MCGitHubRepository }.
	
	possibleRepositoryTypes do: [ :class |
		existingRepositories 
			detect: [ :repo | repo isKindOf: class ]
			ifFound: [ : repo |  ^ repo asIceRepository ].
	].

	self error: ('Could not find a git repository for {1}' format: {anRPackage name})
	