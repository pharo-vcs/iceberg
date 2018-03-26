API-actions
checkout
	"Load all code of a myself into the working copy, and set myself as HEAD"
	
	repository 
		checkoutCommitish: self
		withStrategy: IceCheckoutAllPackages uniqueInstance