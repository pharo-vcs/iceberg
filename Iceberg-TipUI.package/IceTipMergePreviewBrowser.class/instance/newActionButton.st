private factory
newActionButton
	^ self newButton 
		label: 'Merge';
		icon: #merge asIcon;
		help: ('Merges {1} branch with your image''s version.' format: { self model name });
		action: [ self doMerge ];
		yourself