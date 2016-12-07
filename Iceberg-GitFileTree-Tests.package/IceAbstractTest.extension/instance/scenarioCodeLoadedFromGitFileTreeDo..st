*Iceberg-GitFileTree-Tests
scenarioCodeLoadedFromGitFileTreeDo: testActions
	| gitFileTreeRepository lastEntry lastVersion |
	
	gitFileTreeRepository := MCFileTreeGitRemoteRepository
		location: origin
		name: ''
		subdirectory: ''
		branch: ''.
	
	lastEntry := (gitFileTreeRepository allFileNames select: [:entry | entry packageName = 'Pharo-Git-Test' ]) last.	

	lastVersion := gitFileTreeRepository versionFromFileNamed: lastEntry.
	lastVersion load.
	lastVersion workingCopy repositoryGroup addRepository: gitFileTreeRepository.

	testActions ensure: [
		(MCWorkingCopy forPackage: (MCPackage named: 'Pharo-Git-Test')) unload.
		MCRepositoryGroup default removeRepository: gitFileTreeRepository.
	]
