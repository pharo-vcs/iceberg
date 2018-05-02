actions
execute

	| repo cloneOptions |
	location exists ifTrue: [IceCloneLocationAlreadyExists signalFor: self].
	
	[location ensureCreateDirectory.
	
	repo := LGitRepository on: location.
	cloneOptions := LGitCloneOptions withCredentialsProvider: IceCredentialsProvider default.
	cloneOptions checkoutOptions checkoutStrategy: LGitCheckoutStrategyEnum git_checkout_force.

	[ repo clone: url options: cloneOptions ] on: LGit_GIT_EEOF do: [ IceCloneRemoteNotFound signalFor: self ] .

	(LGitRemote of: repo named: 'origin')
		lookup;
		setUrl: url.] on: Error do: [ :error |
			location exists ifTrue: [ location ensureDeleteAll ].
			error pass ]