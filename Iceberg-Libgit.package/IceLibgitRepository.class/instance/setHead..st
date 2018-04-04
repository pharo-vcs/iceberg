private-head
setHead: anIceGitCommitish

	self withRepoDo: [ :repo |
		repo checkout: anIceGitCommitish gitRef options: (LGitCheckoutOptions defaults
			checkoutStrategy: LGitCheckoutStrategyEnum git_checkout_force;
			yourself) ]