*Iceberg-Adapters
getOrCreateIcebergRepository
	| remoteUrl |

	remoteUrl := self perform: Iceberg remoteTypeSelector.
	^ IceRepository registry 
		detect: [ :repo | repo origin url = remoteUrl ]
		ifNone: [
			(IceRepositoryCreator new 
				url: remoteUrl;
				subdirectory: repoPath;
				branchName: self projectVersion;
				createRepository)
				register ]