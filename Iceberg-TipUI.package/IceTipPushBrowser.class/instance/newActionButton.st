private factory
newActionButton
	^ self newButton 
		label: 'Push';
		icon: #up asIcon;
		help: ('Push new commits to {1}' format: { self model remoteName });
		action: [ self doPush ];
		yourself