*Iceberg
getOrCreateIcebergRepository
	| remoteUrl |
	remoteUrl := self perform: Iceberg remoteTypeSelector.
	^ IceRepository registry 
		detect: [ :repo | repo isCloneOfUrl: remoteUrl ]
		ifNone: [ | remote |
			remote := IceGitRemote url: remoteUrl.
			self createIcebergRepositoryWithFallbackFor: remote url: remoteUrl ]