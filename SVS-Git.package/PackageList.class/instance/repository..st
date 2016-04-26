accessing
repository: aGitRepository
	repository := aGitRepository.
	list items: (repository allPackages 
		sorted: [ :a :b | a name < b name ]).
