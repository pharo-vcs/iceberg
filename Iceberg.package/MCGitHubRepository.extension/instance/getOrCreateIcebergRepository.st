*Iceberg-Adapters
getOrCreateIcebergRepository
	| origin |
	origin := self perform: Iceberg remoteTypeSelector.
	
	^ IceRepository registry 
		detect: [ :repo | repo origin url = origin ]
		ifNone: [
			(IceRepository origin: origin) 
				subdirectory: self repoPath;
				checkoutBranch: self projectVersion; 
				register;
				yourself ]