tests-support
newRemoteNamed: aName 
	
	| remoteRepository |
	remoteRepository := IceMemoryRepository new.
	remoteRepository workingCopy: (IceRingWorkingCopy repository: remoteRepository).

	^ IceMemoryRemote
		name: aName
		remoteRepository: remoteRepository
		branchRepository: MCDictionaryRepository new