ancestry
commonAncestorWithCommit: anIceMemoryCommit 
	
	| ancestor ancestorInfo |
	ancestorInfo := mcCommit info commonAncestorWith: anIceMemoryCommit mcCommit info.
	ancestor := repository branchRepository versionWithInfo: ancestorInfo.
	ancestor ifNil: [ ^ nil ].
	
	^ IceMemoryCommit new
		repository: repository;
		mcCommit: ancestor;
		yourself