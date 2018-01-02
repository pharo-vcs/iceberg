instance creation
named: aName inRepository: aRepository

	| branch |
	branch := super inRepository: aRepository.
	branch name: aName.
	^ branch