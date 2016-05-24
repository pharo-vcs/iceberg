repository handling
ensureLocalRepository
	repository ifNil: [ 
		repository := self searchExistingRepository ifNil: [ self createRepository ].
	
		self location exists
			ifTrue: [ 
				repository validate. 
				branch 
					ifNil: [ branch := repository currentBranch. ]
					ifNotNil: [ self checkoutBranch: branch ]]
			ifFalse: [ self createLocalClone ]
	]
	