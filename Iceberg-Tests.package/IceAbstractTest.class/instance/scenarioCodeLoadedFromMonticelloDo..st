scenarios
scenarioCodeLoadedFromMonticelloDo: testActions
	| mcRepository lastEntry lastVersion |
	
	mcRepository := MCSmalltalkhubRepository
	owner: 'NicoPasserini'
	project: 'IcebergTest'
	user: ''
	password: ''.
	
	lastEntry := (mcRepository allFileNames select: [:entry | entry beginsWith: 'Pharo-Git-Test' ]) last.	

	lastVersion := mcRepository versionFromFileNamed: lastEntry.
	lastVersion load.
	lastVersion workingCopy repositoryGroup addRepository: mcRepository.

	testActions ensure: [
		(MCWorkingCopy forPackage: (MCPackage named: 'Pharo-Git-Test')) unload.
		MCRepositoryGroup default removeRepository: mcRepository.
	]
