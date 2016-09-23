scenarios
scenarioCodeLoadedFromGitFileTreeDo: testActions
	| gitFileTreeRepository lastEntry lastVersion |
	
	gitFileTreeRepository := MCFileTreeGitRemoteRepository
		location: 'git@github.com:npasserini/pharo-git-test.git'
		name: ''
		subdirectory: ''
		branch: ''.
	
	lastEntry := (gitFileTreeRepository allFileNames select: [:entry | entry packageName = 'Pharo-Git-Test' ]) last.	

	lastVersion := gitFileTreeRepository versionFromFileNamed: lastEntry.
	lastVersion load.

	testActions ensure: [
		(MCWorkingCopy forPackage: (MCPackage named: 'Pharo-Git-Test')) unload.
		MCRepositoryGroup default removeRepository: gitFileTreeRepository.
	]
