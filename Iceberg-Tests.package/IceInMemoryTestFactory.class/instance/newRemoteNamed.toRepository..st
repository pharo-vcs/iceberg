initialization
newRemoteNamed: aName toRepository: remoteRepository

	^ IceMemoryRemote
		name: aName
		remoteRepository: remoteRepository
		branchRepository: MCDictionaryRepository new