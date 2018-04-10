initialization
initializeCheckoutStrategyList
	| checkoutStrategies |
	checkoutStrategies := self model checkoutStrategies.
	checkoutStrategyList
		items: checkoutStrategies;
		displayBlock: [ :each | each description ].

	checkoutStrategyList whenSelectedItemChanged: [ :aStrategy | 
		self model checkoutStrategy: aStrategy ]