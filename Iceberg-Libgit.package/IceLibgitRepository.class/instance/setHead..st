API-accessing
setHead: anIceGitCommitish
	
	self handleLibgitError: [ 
		self repositoryHandle
			checkout: anIceGitCommitish gitRef
			options:
				(LGitCheckoutOptions defaults
					checkoutStrategy: LGitCheckoutStrategyEnum git_checkout_force;
					yourself) ]