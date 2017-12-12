actions
cloneRepositoryFrom: aRemote branch: aBranchName
	| url |
	
	url := aRemote url.
	LGitGlobal runSequence: [ 
		| repo cloneOptions |
		repo := LGitRepository on: self location.
		cloneOptions := LGitCloneOptions withCredentialsProvider: IceCredentialsProvider default.
		cloneOptions checkoutOptions checkoutStrategy: LGitCheckoutStrategyEnum git_checkout_none.
		[ repo clone: url options: cloneOptions ]
		on: LGit_GIT_ERROR do: [ :e | e acceptError: IceLibgitErrorVisitor new ].
		repo checkout: (aBranchName ifNil: [ 
			self branch
				ifNotNil: [ :b | b name ]
				ifNil: [ 'master' ] ]).

		(LGitRemote of: repo named: 'origin')
			lookup;
			setUrl: url ]