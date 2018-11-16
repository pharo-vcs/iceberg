private factory
newActionButton
	^ self newButton 
		label: 'Checkout';
		icon: (self iconNamed: #branch);
		help: ('Checks out {1} into your image.' format: { self model targetName });
		action: [ self doCheckout ];
		yourself