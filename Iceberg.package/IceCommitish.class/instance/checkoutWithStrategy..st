API-actions
checkoutWithStrategy: aCheckoutStrategy
	"Load code of a myself into the working copy (following strategy), and set myself as HEAD."
	
	repository 
		checkoutCommitish: self
		withStrategy: aCheckoutStrategy