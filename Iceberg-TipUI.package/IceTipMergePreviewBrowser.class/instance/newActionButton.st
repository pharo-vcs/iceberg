private factory
newActionButton
	^ self newButton 
		label: 'Merge';
		icon: (self iconNamed: #merge);
		help: ('Merges {1} with your image''s version.' format: { self model targetName });
		action: [ self doMerge ];
		yourself