repository handling
repository: anMCRepository
	repository := anMCRepository.
	
	(self location exists not or: [ self location hasChildren not ])
		ifTrue: [ 
			repository cloneRepository. 
			repository validate
		]
		ifFalse: [ 
			repository validate. 
			branch 
				ifNil: [ self branchName: repository currentBranch. ]
				ifNotNil: [ self checkoutBranch: branch name ]
		]
	