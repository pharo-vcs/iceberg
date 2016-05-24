repository handling
createRepository
	repository := IceMCGitRepository new
		localRepository: self location;
		remoteUrl: self origin url;
		"subdirectory: '';"
		readonly: false.

	self location exists
		ifTrue: [ 
			repository validate. 
			branch 
				ifNil: [ branch := repository currentBranch. ]
				ifNotNil: [ self checkoutBranch: branch ]]
		ifFalse: [ 
			self createLocalClone. 
			repository validate
		]
	