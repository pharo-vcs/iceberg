private factory
newActionButton
	^ self newButton 
		label: 'Push';
		icon: (self iconNamed: #up);
		help: ('Push new commits to {1}' format: { self model remoteName });
		action: [ self doPush ];
		yourself