instance creation
named: branchName inRepository: repo
	^ self new 
		name: (branchName withoutPrefix: 'refs/remotes/'); 
		repository: repo; 
		yourself