file-access
entryByPath: aString 
	
	^ (LGitCommit of: self repositoryHandle fromHexString: self id) entryByPath: aString