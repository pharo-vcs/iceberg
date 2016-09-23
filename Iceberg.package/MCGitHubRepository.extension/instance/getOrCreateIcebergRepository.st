*Iceberg-Adapters
getOrCreateIcebergRepository
	^ (IceRepository origin: self scpUrl) 
		branchName: self projectVersion; 
		subdirectory: self repoPath;
		register;
		yourself