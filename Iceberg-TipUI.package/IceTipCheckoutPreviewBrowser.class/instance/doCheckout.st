actions
doCheckout
	self model executeCheckoutActionAndThen: [ self window delete ]