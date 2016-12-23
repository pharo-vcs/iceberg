instance creation
remoteName: remoteName branchName: branchName inRepository: aRepository 
	^ self 
		named: 'refs/remotes/', remoteName, '/', branchName 
		inRepository: aRepository 