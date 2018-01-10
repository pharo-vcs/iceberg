file-access
entryByPath: aString 
	
	repository withRepoDo: [ :repo |
		^ (LGitCommit of: repo fromHexString: self id) entryByPath: aString  ]