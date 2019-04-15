initialization
initializeCheckoutStrategyList
	| checkoutStrategies |
	checkoutStrategies := self model checkoutStrategies.
	checkoutStrategyList
		items: checkoutStrategies;
		displayBlock: [ :each | each description ].
	checkoutStrategyList
		whenSelectedItemChangedDo: [ :aStrategy | self model checkoutStrategy: aStrategy ]