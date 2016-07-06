*Iceberg-Core
includesFileNamed: path
	^ (self filesDo: [ :first :second :third | 
		| modifiedFileName |
		modifiedFileName := (LGitDiffDelta fromHandle: first) newFile path.
		(modifiedFileName beginsWith: path) asAlien
	]) asBoolean.
