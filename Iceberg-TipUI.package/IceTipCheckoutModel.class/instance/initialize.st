initialization
initialize

	super initialize.
	checkoutStrategies := (IceCheckoutStrategy allSubclasses 
		sorted: [ :a :b | a order < b order ])
		collect: #new.
	checkoutStrategy := checkoutStrategies first.