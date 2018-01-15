private-loading
checkoutCommitish: aCommitish
	"Make HEAD point to this comitish and load all packages in it into the image"
	
	self setHead: aCommitish.
	workingCopy checkoutAllPackages.