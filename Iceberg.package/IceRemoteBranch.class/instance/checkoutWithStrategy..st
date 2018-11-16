API-actions
checkoutWithStrategy: aCheckoutStrategy
	"checkouts a remote branch"

	"if there is a local branch with that name, checkout it (it will be that what you want, you will need to do 
	a pull later)"	
	self repository localBranches
		detect: [ :each | each name = self shortName ]
		ifFound: [ :each | ^ each checkout ].
	"there are no local repositories. First we need to create one."
	self repository
		createBranch: self shortName 
		inCommit: self commit.
	"then we can do the checkout"
	^ super checkoutWithStrategy: aCheckoutStrategy