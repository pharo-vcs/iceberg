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
		on: LGit_GIT_ERROR 
		do: [ :e | 
			"sad that I need to do it like this :("
			(e messageText beginsWith: 'error authenticating:')
				ifTrue: [ 
					Stdio stdout << 'AUTH Error: ' << e object asString << ': ' << e messageText; lf.
					e resignalAs: IceAuthenticationError new ] ].
		repo checkout: (aBranchName ifNil: [ 
			self branch
				ifNotNil: [ :b | b name ]
				ifNil: [ 'master' ] ]).

		(LGitRemote of: repo named: 'origin')
			lookup;
			setUrl: url ]