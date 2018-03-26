actions
doCheckout
	self model 
		checkoutWithStrategy: self selectedCheckoutStrategy
		then: [ self window delete ]