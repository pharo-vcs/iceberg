API-checkout
checkout: aCheckoutStrategy

	| localBranch |
	self repository 
		branchNamed: self shortName
		ifPresent: [ :branch | IceError signal: ('Branch {1} already exists' format: { self shortName }) ].
	
	localBranch := self repository
		createBranch: self shortName
		inCommit: self commit.

	aCheckoutStrategy committish: localBranch.
	^ localBranch checkout: aCheckoutStrategy