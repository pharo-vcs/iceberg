private factory
newActionButton
	^ self newButton 
		label: 'Checkout';
		icon: #branch asIcon;
		help: ('Checks out {1} branch into your image.' format: { self model name });
		action: [ self doCheckout ];
		yourself