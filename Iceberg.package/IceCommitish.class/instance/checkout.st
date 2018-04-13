API-actions
checkout
		
	self checkout: (IceCheckoutAlreadyLoadedPackages new
		committish: self;
		yourself)