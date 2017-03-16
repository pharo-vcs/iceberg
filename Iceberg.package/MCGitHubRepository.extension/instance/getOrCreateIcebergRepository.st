*Iceberg-Adapters
getOrCreateIcebergRepository
	| remoteUrl remote |

	remoteUrl := self perform: Iceberg remoteTypeSelector.
	remote := IceRemote url: remoteUrl.
	^ IceRepository registry 
		detect: [ :repo | repo origin isSameUrl: remote ]
		ifNone: [
			(IceRepositoryCreator new 
				url: remoteUrl;
				addSubdirectory: repoPath;
				branchName: self projectVersion;
				createRepository)
				register ]