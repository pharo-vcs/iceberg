repository handling
repository: anMCRepository
	repository := anMCRepository.
	
	self location exists
		ifTrue: [ 
			repository validate. 
			branch 
				ifNil: [ self branchName: repository currentBranch. ]
				ifNotNil: [ self checkoutBranch: branch name ]]
		ifFalse: [
			branch ifNotNil: [ repository branch: branch name ].
			repository cloneRepository. 
			repository validate
		]
	