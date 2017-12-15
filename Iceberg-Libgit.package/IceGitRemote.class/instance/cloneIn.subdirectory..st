cloning
cloneIn: aFileReference subdirectory: aSubdirectoryString 
	
	LGitGlobal runSequence: [ 
		| repo cloneOptions |
		repo := LGitRepository on: aFileReference.
		cloneOptions := LGitCloneOptions withCredentialsProvider: IceCredentialsProvider default.
		cloneOptions checkoutOptions checkoutStrategy: LGitCheckoutStrategyEnum git_checkout_force.
		repo clone: url options: cloneOptions.
		
		(LGitRemote of: repo named: 'origin')
			lookup;
			setUrl: url ].
	
	^ IceLibgitRepository new
		location: aFileReference;
		subdirectory: aSubdirectoryString;
		yourself