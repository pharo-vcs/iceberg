repository handling
createRepository
	repository := (self storageClass 
		newRepositoryAt: self location
		origin: self origin
		subdirectory: (self subdirectory ifNil: '')).
		
	branch ifNotNil: [ repository branch: self branchName ].
	self repository: repository.

