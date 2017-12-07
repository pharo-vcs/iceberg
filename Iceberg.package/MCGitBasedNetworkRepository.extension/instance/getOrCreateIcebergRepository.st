*Iceberg-Adapters
getOrCreateIcebergRepository
	| remoteUrl remote |

	remoteUrl := self perform: Iceberg remoteTypeSelector.
	remote := IceRemote url: remoteUrl.
	^ IceRepository registry 
		detect: [ :repo | repo origin referencesSameRemoteLocationAs: remote ]
		ifNone: [
			| urlToUse |
			urlToUse := remote url.
			[ (IceRepositoryCreator new 
				url: urlToUse;
				subdirectory: repoPath;
				branchName: self projectVersion;
				createRepository)
				register ]
			on: IceAuthenticationError 
			do: [ :e |
				self crLog: ('I got an error while cloning: {1}. I will try to clone the HTTPS variant.' format: { e messageText }). 
				urlToUse := remote httpsUrl.
				e retry ] ]