instance creation
newRemoteNamed: aName

	^ IceMemoryRemote
		name: aName
		remoteRepository: IceMemoryRepository new
		branchRepository: MCDictionaryRepository new