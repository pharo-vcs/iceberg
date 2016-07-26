accessing
repository: anMCRepository
	repository := anMCRepository.
	
	self location exists
		ifTrue: [ 
			repository validate. 
			branch 
				ifNil: [ self branchName: repository currentBranch. ]
				ifNotNil: [ self checkoutBranch: branch name ]]
		ifFalse: [ 
			repository cloneRepository. 
			repository validate
		]
	