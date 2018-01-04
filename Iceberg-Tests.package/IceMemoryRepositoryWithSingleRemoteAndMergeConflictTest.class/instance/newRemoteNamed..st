test-support
newRemoteNamed: aName

	remoteRepository := IceMemoryRepository new.
	remoteRepository workingCopy: (IceRingWorkingCopy repository: remoteRepository).

	^ IceMemoryRemote
		name: aName
		remoteRepository: remoteRepository
		branchRepository: MCDictionaryRepository new