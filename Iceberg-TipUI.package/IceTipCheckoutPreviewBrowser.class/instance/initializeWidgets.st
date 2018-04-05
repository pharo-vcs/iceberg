initialization
initializeWidgets
	super initializeWidgets.
	
	diffPanel leftLabel: 'Working Copy'.
	diffPanel rightLabel: 'Checkout ' , model targetName.
	
	checkoutStrategyLabel := self newLabel label: 'How to checkout:'.
	checkoutStrategyList := self newDropList.
	self initializeCheckoutStrategyList.
	
	self focusOrder 
		removeAll;
		add: self actionPanel;
		add: self checkoutStrategyList;
		add: self diffPanel