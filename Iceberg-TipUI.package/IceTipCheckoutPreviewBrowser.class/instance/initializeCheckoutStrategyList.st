initialization
initializeCheckoutStrategyList
	| checkoutStrategies |
	checkoutStrategies := self model checkoutStrategies.
	checkoutStrategyList
		items: checkoutStrategies;
		displayBlock: [ :each | each description ].

	checkoutStrategyList whenSelectedItemChanged: [ :aStrategy | 
		selectedCheckoutStrategy := aStrategy  ].
	selectedCheckoutStrategy := checkoutStrategies first