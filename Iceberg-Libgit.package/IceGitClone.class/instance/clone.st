actions
clone

	| repo cloneOptions |
	self assert: location exists not.
	location ensureCreateDirectory.
	
	repo := LGitRepository on: location.
	cloneOptions := LGitCloneOptions withCredentialsProvider: IceCredentialsProvider default.
	cloneOptions checkoutOptions checkoutStrategy: LGitCheckoutStrategyEnum git_checkout_force.
	repo clone: url options: cloneOptions.
	(LGitRemote of: repo named: 'origin')
		lookup;
		setUrl: url.