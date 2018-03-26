private-loading
checkoutCommitish: aCommitish withStrategy: aCheckoutStrategy
	"Make HEAD point to this comitish and load all packages in it into the image"
	
	self setHead: aCommitish.
	aCheckoutStrategy checkoutPackagesOn: self workingCopy