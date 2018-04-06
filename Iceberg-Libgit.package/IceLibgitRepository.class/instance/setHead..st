private-head
setHead: anIceGitCommitish
	self repositoryHandle
		checkout: anIceGitCommitish gitRef
		options:
			(LGitCheckoutOptions defaults
				checkoutStrategy: LGitCheckoutStrategyEnum git_checkout_force;
				yourself)