*Iceberg-Core
getOrCreateIcebergRepository
	^ (IceRepository origin: self scpUrl) 
		branchName: self projectVersion; 
		register;
		yourself