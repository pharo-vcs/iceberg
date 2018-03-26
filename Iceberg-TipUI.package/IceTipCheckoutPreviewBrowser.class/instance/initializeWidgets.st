initialization
initializeWidgets
	super initializeWidgets.
	
	checkoutStrategyLabel := self newLabel label: 'How to checkout:'.
	checkoutStrategyList := self newDropList.
	self initializeCheckoutStrategyList.
	
	self focusOrder 
		removeAll;
		add: self actionPanel;
		add: self checkoutStrategyList;
		add: self diffPanel