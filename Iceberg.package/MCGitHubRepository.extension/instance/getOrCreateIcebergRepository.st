*Iceberg-Adapters
getOrCreateIcebergRepository
	| origin |
	origin := self scpUrl.
	^ IceRepository registry 
		detect: [ :repo | repo origin url = origin ]
		ifNone: [
			(IceRepository origin: self scpUrl) 
				subdirectory: self repoPath;
				checkoutBranch: self projectVersion; 
				register;
				yourself ]