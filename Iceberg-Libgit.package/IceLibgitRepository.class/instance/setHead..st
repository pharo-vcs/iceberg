API-accessing
setHead: anIceGitCommitish
	
	"Need to keep the reference, if not it is garbage collected. As the options are only passed to a FFI call"
	| progress |
	progress := IceGitCheckoutProgress new.
	
	self handleLibgitError: [ 
		self repositoryHandle
			checkout: anIceGitCommitish gitRef
			options:
				(LGitCheckoutOptions defaults
					checkoutStrategy: LGitCheckoutStrategyEnum git_checkout_force;
					progressCallback: progress;
					yourself) ]