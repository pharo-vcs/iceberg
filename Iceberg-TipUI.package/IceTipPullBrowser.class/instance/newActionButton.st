private factory
newActionButton
	^ self newButton 
		label: 'Pull';
		icon: #down asIcon;
		help: ('Pull new commits from {1}' format: { self model remoteName });
		action: [ self doPull ];
		yourself