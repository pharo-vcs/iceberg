actions
execute

	| repo cloneOptions checkoutOptions callbacks |
	location exists
		ifTrue: [ IceCloneLocationAlreadyExists signalFor: location ].
	
	[location ensureCreateDirectory.
	
	repo := LGitRepository on: location.
	cloneOptions := LGitCloneOptions withCredentialsProvider: (IceCredentialsProvider defaultForRemoteUrl: url).

	"Keeping references, because if not the GC take them."
	checkoutOptions := cloneOptions checkoutOptions.
	callbacks := cloneOptions fetchOptions callbacks.
	callbacks transferProgress: IceGitTransferProgress new.
	
	checkoutOptions checkoutStrategy: LGitCheckoutStrategyEnum git_checkout_force.
	checkoutOptions progressCallback: IceGitCheckoutProgress new.

	repo clone: url options: cloneOptions.

	(LGitRemote of: repo named: 'origin')
		lookup;
		setUrl: url.
		
	] on: LGitCallReturnHandler , IceWrongUrl do: [ :error |
		location exists ifTrue: [ location ensureDeleteAll ].
		error acceptError: (IceLibgitErrorVisitor onContext: self) ].