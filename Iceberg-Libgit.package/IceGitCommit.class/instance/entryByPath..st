file-access
entryByPath: aString 
	
	repository handleLibgitError: [ ^ (LGitCommit of: self repositoryHandle fromHexString: self id) entryByPath: aString ]