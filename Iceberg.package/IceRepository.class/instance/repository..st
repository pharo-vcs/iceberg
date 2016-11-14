repository handling
repository: anMCRepository
	backend := anMCRepository.

	(self location exists not or: [ self location hasChildren not ])
		ifTrue: [ backend cloneRepository ].

	backend validate
