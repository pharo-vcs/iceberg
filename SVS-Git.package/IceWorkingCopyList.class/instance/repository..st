accessing
repository: aGitRepository
	repository := aGitRepository.
	list items: ((Ice workingCopiesForRepository: repository) 
		sorted: [ :a :b | a name < b name ]).
